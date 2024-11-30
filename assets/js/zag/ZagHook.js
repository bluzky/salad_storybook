import { Component } from "./component";
import { camelize, getBooleanOption, getOption } from "./utils";

export default {
  mounted() {
    try {
      this.component = new Component(this.el, this.context());
      this.component.init();
    } catch (error) {
      console.error("Error mounting component:", error);
    }
  },

  updated() {
    // re-render the component when the context changes
    this.component.render();
  },

  destroyed() {
    try {
      this.component.destroy();
    } catch (error) {
      console.error("Error destroying component:", error);
    }
  },

  context() {
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
  },
};
