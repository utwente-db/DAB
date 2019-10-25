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
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/frontend/scripts/alert.ts");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/frontend/scripts/alert.ts":
/*!***************************************!*\
  !*** ./src/frontend/scripts/alert.ts ***!
  \***************************************/
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
var delay = function (ms) { return new Promise(function (res) { return setTimeout(res, ms); }); };
function generateAlertHTML(errorMessage, alertType, dismissable) {
    if (dismissable === void 0) { dismissable = true; }
    var dismissableString = dismissable ? "alert-dismissible" : "temp-alert";
    var buttonString = dismissable ? " <button type=\"button\" class=\"close error-dismiss-button\" data-dismiss=\"alert\"\n            aria-label=\"Close\">\n            <span aria-hidden=\"true\">&times;</span>\n            </button>" : "";
    return "<div class=\"alert " + alertType + " " + dismissableString + " fade show col-12\"  role=\"alert\">\n            <div class=\"error-text\">" + errorMessage + "</div>\n            " + buttonString + "\n            </div>";
}
exports.generateAlertHTML = generateAlertHTML;
function addAlert(errorMessage, alertType, tempAlert) {
    if (tempAlert === void 0) { tempAlert = null; }
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
    }
    var alertDiv = document.getElementById("alert-div");
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType);
    var alert = alertDiv.lastChild;
    // noinspection JSIgnoredPromiseFromCall
    removeAlertOnTimeout(alert, 10000, false);
    return alert;
}
exports.addAlert = addAlert;
function removeTempAlerts() {
    var tempAlerts = document.getElementsByClassName("temp-alert");
    for (var i = 0; i < tempAlerts.length; i++) {
        var alert_1 = tempAlerts[i];
        alert_1.remove();
    }
}
function removeAlertOnTimeout(tempAlert, ms, timeOutError) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, delay(ms)];
                case 1:
                    _a.sent();
                    if (tempAlert && document.body.contains(tempAlert)) {
                        tempAlert.remove();
                        if (timeOutError) {
                            addAlert("Request timed out", AlertType.danger);
                        }
                    }
                    return [2 /*return*/];
            }
        });
    });
}
function addTempAlert(errorMessage, alertType, timeOutError, ms) {
    if (errorMessage === void 0) { errorMessage = "Please wait..."; }
    if (alertType === void 0) { alertType = AlertType.secondary; }
    if (timeOutError === void 0) { timeOutError = true; }
    if (ms === void 0) { ms = 10000; }
    var alertDiv = document.getElementById("alert-div");
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType, false);
    var tempAlert = alertDiv.lastChild;
    // noinspection JSIgnoredPromiseFromCall
    if (ms > 0) {
        removeAlertOnTimeout(tempAlert, ms, timeOutError);
    }
    return tempAlert;
}
exports.addTempAlert = addTempAlert;
function addErrorAlert(error, tempAlert) {
    if (tempAlert === void 0) { tempAlert = null; }
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
    }
    var responseError = error;
    var response = responseError.response;
    if (response) {
        // This is an axios error
        if (response.data === undefined || response.data === null || response.data === "") {
            // This is an axios error with empty body, just print standard error message with status code
            addAlert(error.message, AlertType.danger);
        }
        else if (typeof response.data === "string") {
            var errorString = response.data;
            // This is an axios error with string body
            if (response.status === 403 && errorString === "token expired") {
                addAlert("Your reset token has expired. Please request a new one.", AlertType.danger);
            }
            else {
                // Print the string
                addAlert(errorString, AlertType.danger);
            }
        }
        else {
            // This is an axios error with django error body
            var errorObject = response.data;
            var errorKeys = Object.keys(errorObject);
            var errorMessages = Object.values(errorObject);
            // check for specific errors
            if (errorKeys[0] === "non_field_errors" && errorMessages[0][0] === "The fields course, fid must make a unique set.") {
                // If this is a specific alert for requesting a database as user and getting a 409 with this message back:
                addAlert("You already have database credentials for this course", AlertType.danger);
            }
            else if (errorKeys[0] === "email" && errorMessages[0][0] === "dbmusers with this email already exists.") {
                addAlert("Another user is already registered using this e-mail", AlertType.danger);
            }
            else { // No longer checking for specific errors
                // This is a response error (4XX or 5XX etc)
                var alertMessage = "";
                for (var i = 0; i < errorKeys.length; i++) {
                    alertMessage += (errorKeys[i] + ":<br>" + errorMessages[i].join("<br>") + "<br<br>");
                }
                addAlert(error + "<br><br>" + alertMessage, AlertType.danger);
            }
        }
    }
    else {
        // This is a generic javascript error
        addAlert(error.message, AlertType.danger);
    }
}
exports.addErrorAlert = addErrorAlert;
var AlertType;
(function (AlertType) {
    AlertType["primary"] = "alert-primary";
    AlertType["secondary"] = "alert-secondary";
    AlertType["danger"] = "alert-danger";
    AlertType["success"] = "alert-success";
})(AlertType = exports.AlertType || (exports.AlertType = {}));


/***/ })

/******/ });
//# sourceMappingURL=alert.js.map