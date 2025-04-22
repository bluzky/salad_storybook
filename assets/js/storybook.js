// If your components require any hooks or custom uploaders, or if your pages
// require connect parameters, uncomment the following lines and declare them as
// such:
//
import { ChartHook } from "./hooks";
import SaladUI from "../../../salad_ui/assets/index";
import "../../../salad_ui/assets/components/dialog";
import "../../../salad_ui/assets/components/select";
import "../../../salad_ui/assets/components/tabs";
import "../../../salad_ui/assets/components/radio_group";
import "../../../salad_ui/assets/components/popover";
import "../../../salad_ui/assets/components/hover-card";
import "../../../salad_ui/assets/components/collapsible";
import "../../../salad_ui/assets/components/tooltip";
import "../../../salad_ui/assets/components/accordion";
import "../../../salad_ui/assets/components/slider";
import "../../../salad_ui/assets/components/switch";

// import * as Params from "./params";
// import * as Uploaders from "./uploaders";

(function () {
  window.storybook = {
    Hooks: {
      ChartHook,
      SaladUI: SaladUI.SaladUIHook,
    },
  };
})();

// If your components require alpinejs, you'll need to start
// alpine after the DOM is loaded and pass in an onBeforeElUpdated
//
// import Alpine from 'alpinejs'
// window.Alpine = Alpine
// document.addEventListener('DOMContentLoaded', () => {
//   window.Alpine.start();
// });

// (function () {
//   window.storybook = {
//     LiveSocketOptions: {
//       dom: {
//         onBeforeElUpdated(from, to) {
//           if (from._x_dataStack) {
//             window.Alpine.clone(from, to)
//           }
//         }
//       }
//     }
//   };
// })();

window.addEventListener("phx:js-exec", ({ detail }) => {
  document.querySelectorAll(detail.to).forEach((el) => {
    liveSocket.execJS(el, el.getAttribute(detail.attr));
  });
});

// Mutation observer to highlight changed elements
// new MutationObserver((mutations) => {
//   mutations.forEach((mutation) => {
//     if (mutation.type === "childList") {
//       mutation.addedNodes.forEach((node) => {
//         if (node.nodeType === Node.ELEMENT_NODE) {
//           node.style.transition = "outline 0.3s ease-in-out";
//           node.style.outline = "2px solid red";
//           setTimeout(() => {
//             node.style.outline = "none";
//             node.style.transition = "";
//           }, 1000);
//         }
//       });
//     }
//   });
// }).observe(document.body, {
//   childList: true,
//   subtree: true,
// });
