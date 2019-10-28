// // tslint:disable-next-line:typedef
// function getComponent(): Promise<HTMLDivElement> {
//   // Lazily load the "lodash" package and name
//   // the code split chunk "lodash" using the
//   // webpackChunkName magic comment.
//   return (
//     import(/* webpackChunkName: "lodash" */ "lodash")
//       // Rename the default import to "_"
//       // (done by convention with lodash, not necessary)
//       .then(({ default: _ }) => {
//         // Create a new HTML element
//         const element = document.createElement("div");
//         element.innerHTML = .join(["Hello", "webpack"], " ");
//         return element;
//       })
//   );
// }
//
// // Lazily load the "component". Once the promise to
// // load the module has resolved, append the
// // element to the body.
// getComponent().then(component => {
//   document.body.appendChild(component);
// });

import * as ES6Promise from "es6-promise";
ES6Promise.polyfill();
import {initNavbar} from /* webpackChunkName: "navbar" */"./navbar";

window.onload = () => {
    initNavbar(() => {
        return;
    })
};