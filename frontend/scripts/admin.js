/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/frontend/scripts/admin.ts");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/frontend/scripts/admin.ts":
/*!***************************************!*\
  !*** ./src/frontend/scripts/admin.ts ***!
  \***************************************/
/*! no static exports found */
<<<<<<< HEAD
/***/ (function(module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var axios_1 = __webpack_require__(/*! axios */ "./node_modules/axios/index.js");
var navbar_1 = __webpack_require__(/*! ./navbar */ "./src/frontend/scripts/navbar.ts");
__webpack_require__(/*! popper.js */ "./node_modules/popper.js/dist/esm/popper.js");
__webpack_require__(/*! bootstrap */ "./node_modules/bootstrap/dist/js/bootstrap.js");
var usersHtml = document.getElementById("users");
var coursesNavHtml = document.getElementById("courses-nav");
var coursesContentHtml = document.getElementById("courses-content");
function getCoursesPromise() {
    return __awaiter(this, void 0, void 0, function () {
        var response;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, axios_1.default.get("/rest/courses/")];
                case 1:
                    response = _a.sent();
                    return [2 /*return*/, response.data];
            }
        });
    });
}
function getUsersPromise() {
    return __awaiter(this, void 0, void 0, function () {
        var response;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, axios_1.default.get("/rest/dbmusers/")];
                case 1:
                    response = _a.sent();
                    return [2 /*return*/, response.data];
            }
        });
    });
}
function displayCourses() {
    return __awaiter(this, void 0, void 0, function () {
        var courses, resultNav, resultContent, i, active, resultNavString, resultContentString;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getCoursesPromise()];
                case 1:
                    courses = _a.sent();
                    resultNav = [];
                    resultContent = [];
                    for (i = 0; i < courses.length; i++) {
                        active = "";
                        if (i === 0) {
                            active = " active";
                        }
                        resultNav.push("<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + i + "\">" + courses[i].coursename + "</a>");
                        resultContent.push("<div class=\"tab-pane" + active + "\" id=\"course" + i + "\">"
                            + "<ul><li>ID: " + courses[i].courseid + "</li>"
                            + "<li>FID: " + courses[i].fid + "</li>"
                            + "<li>Coursename: " + courses[i].coursename + "</li>"
                            + "<li>Info: " + courses[i].info + "</li></ul>"
                            + "<a class=\"btn btn-secondary\" href=\"/courses#" + courses[i].courseid + "\" role=\"button\">Edit Course</a></div>");
                    }
                    resultNavString = resultNav.join("\n");
                    resultContentString = resultContent.join("\n");
                    coursesNavHtml.innerHTML += resultNavString;
                    coursesContentHtml.innerHTML += resultContentString;
                    return [2 /*return*/];
            }
        });
    });
}
function displayUsers() {
    return __awaiter(this, void 0, void 0, function () {
        var users, result, i, role, verified, resultString;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getUsersPromise()];
                case 1:
                    users = _a.sent();
                    result = [];
                    for (i = 0; i < users.length; i++) {
                        role = void 0;
                        if (users[i].role === 0) {
                            role = "Admin";
                        }
                        else if (users[i].role === 1) {
                            role = "Teacher";
                        }
                        else if (users[i].role === 2) {
                            role = "Student";
                        }
                        else {
                            role = "Unknown";
                        }
                        verified = users[i].verified;
                        result.push("<tr><th scope=\"row\">" + users[i].id + "</th>"
                            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage\">" + role + "</td>"
                            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage\">" + users[i].email + "</td>"
                            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage\">" + verified + "</td></tr></a>"
                        // "<tr><th scope=\"row\">" + users[i].id + "</th>"
                        // + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + role + "</td>"
                        // + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + users[i].email + "</td>"
                        // + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + verified + "</td></tr></a>"
                        );
                    }
                    resultString = result.join("\n");
                    usersHtml.innerHTML += resultString;
                    return [2 /*return*/];
            }
        });
    });
}
window.onload = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, displayUsers()];
            case 1:
                _a.sent();
                return [4 /*yield*/, displayCourses()];
            case 2:
                _a.sent();
                return [4 /*yield*/, navbar_1.displayWhoami()];
            case 3:
                _a.sent();
                return [2 /*return*/];
        }
    });
}); };


/***/ }),

/***/ "./src/frontend/scripts/navbar.ts":
/*!****************************************!*\
  !*** ./src/frontend/scripts/navbar.ts ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var axios_1 = __webpack_require__(/*! axios */ "./node_modules/axios/index.js");
__webpack_require__(/*! popper.js */ "./node_modules/popper.js/dist/esm/popper.js");
__webpack_require__(/*! bootstrap */ "./node_modules/bootstrap/dist/js/bootstrap.js");
var whoamiWelcomeHtml = document.getElementById("whoamiWelcome");
var whoamiButtonHtml = document.getElementById("whoamiButton");
function getWhoamiPromise() {
    return __awaiter(this, void 0, void 0, function () {
        var response;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, axios_1.default.get("/rest/whoami/")];
                case 1:
                    response = _a.sent();
                    return [2 /*return*/, response.data];
            }
        });
    });
}
function displayWhoami() {
    return __awaiter(this, void 0, void 0, function () {
        var whoami, role;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getWhoamiPromise()];
                case 1:
                    whoami = _a.sent();
                    if (whoami.role === 0) {
                        role = "an Admin";
                    }
                    else if (whoami.role === 1) {
                        role = "a Teacher";
                    }
                    else if (whoami.role === 2) {
                        role = "a Student";
                    }
                    else {
                        role = "Unknown";
                    }
                    whoamiWelcomeHtml.innerHTML += "Welcome " + whoami.email + "\t You are " + role;
                    whoamiButtonHtml.innerHTML += "<a class=\"btn btn-secondary\" href=\"/settings\" role=\"button\">Settings</a>";
                    return [2 /*return*/];
            }
        });
    });
}
exports.displayWhoami = displayWhoami;
=======
/***/ (function(module, exports) {
>>>>>>> 9b946296a12b6f3826fbc42d8387a2470337ff0a

throw new Error("Module build failed (from ./node_modules/ts-loader/index.js):\nError: TypeScript emitted no output for /home/denys/design/src/frontend/scripts/admin.ts.\n    at makeSourceMapAndFinish (/home/denys/design/node_modules/ts-loader/dist/index.js:80:15)\n    at successLoader (/home/denys/design/node_modules/ts-loader/dist/index.js:68:9)\n    at Object.loader (/home/denys/design/node_modules/ts-loader/dist/index.js:22:12)");

/***/ })

/******/ });
//# sourceMappingURL=admin.js.map