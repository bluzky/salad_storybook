import * as componentsModules from "./index";
import { camelize, normalizeProps } from "./utils";

/*
  document for component
   */

export class Component {
  el; // root element
  context; // context passed to the component
  service; // state machine service
  api; // api object
  cleanupFunctions = new Map(); // cleanup functions for event listeners

  constructor(el, context) {
    this.el = el;
    this.context = context;
  }

  // Initialize the component
  init() {
    this.initializeComponent();
    this.render();

    // Re-render on state updates
    this.service.subscribe(() => {
      this.api = this.initApi(this.componentModule);
      this.render();
    });

    this.service.start();
  }

  destroy() {
    this.service.stop();
    this.cleanup();
  }

  // clean up event listeners
  cleanup() {
    for (const cleanupFn of this.cleanupFunctions.values()) {
      cleanupFn();
    }
    this.cleanupFunctions.clear();
  }

  /*----------------- Private methods -----------------*/

  extractContext() {
    try {
      const options = this.el.dataset.options
        ? Object.fromEntries(
            Object.entries(JSON.parse(this.el.dataset.options)).map(
              ([key, value]) => [
                camelize(key),
                value === "bool"
                  ? getBooleanOption(this.el, key)
                  : getOption(this.el, key, value),
              ],
            ),
          )
        : {};

      const listeners = this.el.dataset.listeners
        ? JSON.parse(this.el.dataset.listeners)
            .map((event) => ({
              [`on${camelize(event, true)}Change`]: (details) =>
                this.pushEvent(event, details),
            }))
            .reduce((acc, listener) => ({ ...acc, ...listener }), {})
        : {};

      return {
        id: this.el.id || "",
        ...options,
        ...listeners,
      };
    } catch (error) {
      console.error("Error parsing context:", error);
      return {};
    }
  }

  initializeComponent() {
    // component name is set on the root element via data-component attribute
    const componentName = this.el.dataset.component;

    if (!componentName || !componentsModules[componentName]) {
      console.error(`Component "${componentName}" not found.`);
      return;
    }

    this.componentModule = componentsModules[componentName];
    this.service = this.initService(this.componentModule, this.context);
    this.api = this.initApi(this.componentModule);
  }

  initService(component, context) {
    return component.machine(context);
  }

  initApi(component) {
    return component.connect(
      this.service.state,
      this.service.send,
      normalizeProps,
    );
  }

  render() {
    this.cleanup();

    for (const part of ["root", ...this.parts(this.el)]) {
      this.renderPart(this.el, part, this.api);
    }

    for (const item of this.el.querySelectorAll("[data-part='item']")) {
      this.renderItem(item);
    }
  }

  renderPart(root, name, api, opts = {}) {
    const isRoot = name === "root";
    const part = isRoot ? root : root.querySelector(`[data-part='${name}']`);

    const getterName = `get${camelize(name, true)}Props`;

    if (part && api[getterName]) {
      const cleanup = this.spreadProps(part, api[getterName](opts), isRoot);
      this.cleanupFunctions.set(part, cleanup);
    }
  }

  // Render an item in a list item
  renderItem(item) {
    const value = item.dataset.value;
    if (!value) {
      console.error("Missing `data-value` attribute on item.");
      return;
    }

    const cleanup = this.spreadProps(item, this.api.getItemProps({ value }));
    this.cleanupFunctions.set(item, cleanup);

    for (const part of this.parts(item)) {
      this.renderPart(item, `item-${part}`, this.api, { value });
    }
  }

  // get parts from the element, default to an empty array
  // parts data is encoded json in the data-parts attribute
  parts(el) {
    try {
      return JSON.parse(el.dataset.parts || "[]");
    } catch (error) {
      console.error("Error parsing parts:", error);
      return [];
    }
  }

  // spread props to the element
  // if the prop is an event, update the event listener if it's new or changed
  // if the prop is an attribute, update the attribute value if it's new or changed
  spreadProps(el, attrs, isRoot = false) {
    const prevAttrsMap = new WeakMap();
    const oldAttrs = prevAttrsMap.get(el) || {};
    const eventHandlers = new Map();
    const attrKeys = Object.keys(attrs);

    // for given event name and callback
    // if the event is new or changed, add the event listener
    const addEvent = (event, callback) => {
      const existingHandler = eventHandlers.get(event);
      // same, do nothing
      if (existingHandler && oldAttrs[`on${event}`] === callback) {
        return;
      }

      // changed, remove the old event listener
      if (existingHandler) {
        el.removeEventListener(event.toLowerCase(), existingHandler);
      }

      // add the new event listener
      const handler = (e) => callback(e);
      eventHandlers.set(event, handler);
      el.addEventListener(event.toLowerCase(), handler);
    };

    const removeEvent = (event) => {
      const handler = eventHandlers.get(event);
      if (handler) {
        el.removeEventListener(event.toLowerCase(), handler);
        eventHandlers.delete(event);
      }
    };

    // add event if it's new or changed
    const setup = (attr) => {
      const eventName = attr.substring(2);
      const newHandler = attrs[attr];
      const existingHandler = oldAttrs[attr];

      if (newHandler !== existingHandler) {
        addEvent(eventName, newHandler);
      }
    };

    // update attribute value if it's new or changed
    const apply = (attrName) => {
      // avoid replacing id on root element because LiveView
      // will lose track of it and DOM patching will not work as expected
      if (attrName === "id" && isRoot) return;

      let value = attrs[attrName];
      const oldValue = oldAttrs[attrName];

      if (value === oldValue) return;

      if (typeof value === "boolean") value = value || undefined;

      if (value == null) {
        el.removeAttribute(attrName.toLowerCase());
        return;
      }

      if (["value", "checked", "htmlFor"].includes(attrName)) {
        if (el[attrName] !== value) {
          el[attrName] = value;
        }
      } else {
        const currentAttr = el.getAttribute(attrName.toLowerCase());
        if (currentAttr !== String(value)) {
          el.setAttribute(attrName.toLowerCase(), value);
        }
      }
    };

    attrKeys.forEach((key) => {
      if (key.startsWith("on")) setup(key);
      else apply(key);
    });

    prevAttrsMap.set(el, attrs);

    return () => {
      attrKeys
        .filter((key) => key.startsWith("on"))
        .forEach((key) => {
          const eventName = key.substring(2).toLowerCase();
          removeEvent(eventName);
        });
      prevAttrsMap.delete(el);
    };
  }
}
