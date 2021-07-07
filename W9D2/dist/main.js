/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ../util */ \"./util.js\");\n\nUtil.inherits(Asteroid, MovingObject);\n\nfunction Asteroid(obj) {\n    this.color = \"#5085BC\";\n    this.radius = 3;\n    MovingObject.call(this, obj);\n}\n\nmodule.exports = Asteroid;\n\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\ndocument.addEventListener('DOMContentLoaded', function () {\n  window.MovingObject = MovingObject;\n\n  let canvasElement = document.getElementById(\"game-canvas\");\n  const ctx = canvasElement.getContext(\"2d\");\n  console.log(ctx);\n  // debugger\nconst mo = new MovingObject({\n  pos: [30, 30],\n  vel: [10, 10], \n  radius: 5,\n  color: \"#00FF00\"\n});\n\nconst ast = new Asteroid({\n  pos: [50, 50],\n  vel: [20, 20],\n  });\n\nmo.draw(ctx);\nast.draw(ctx);\n\n});\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("console.log(\"Test\")\n\nfunction MovingObject(obj) {\n  // debugger\n  this.pos = obj.pos;\n  this.vel = obj.vel;\n  this.radius = obj.radius;\n  this.color = obj.color;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.fillStyle = this.color;\n\n  ctx.beginPath();\n  \n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    true\n  );\n\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  this.pos[0] = this.pos[0] + this.vel[0];\n  this.pos[1] = this.pos[1] + this.vel[1];\n};\n\nmodule.exports = MovingObject;\n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./util.js":
/*!*****************!*\
  !*** ./util.js ***!
  \*****************/
/***/ ((module) => {

eval("const Util = {\n    inherits: function inherits(childClass, parentClass) {\n        let Surrogate = function() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;