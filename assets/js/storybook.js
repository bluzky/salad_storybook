// If your components require any hooks or custom uploaders, or if your pages
// require connect parameters, uncomment the following lines and declare them as
// such:
//
import { ChartHook } from "./hooks";
import SaladUI from "../../../salad_ui/assets/index";
import "../../../salad_ui/assets/components/dialog";
import "../../../salad_ui/assets/components/select";
import "../../../salad_ui/assets/components/tabs";

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
