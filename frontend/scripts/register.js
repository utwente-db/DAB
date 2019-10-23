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
require("../sass/main.sass");
require("popper.js");
require("bootstrap");
require("bootstrap-select");
var alert_1 = require("./alert");
var axios_1 = require("axios");
var registerButton = document.getElementById("register-button");
var registerEmailField = document.getElementById("register-email-field");
var registerPasswordField = document.getElementById('register-password-field');
var registerPasswordConfirmField = document.getElementById('register-password-confirm-field');
var content = document.getElementById('content');
function setValid(input) {
    input.classList.remove("is-invalid");
    input.classList.add("is-valid");
    if (input.nextElementSibling) {
        var errorField = input.nextElementSibling;
        errorField.textContent = "";
    }
    else {
        console.error("No sibling element for input. Contact the front-end devs with this error");
    }
}
exports.setValid = setValid;
function setInvalid(input, error) {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid");
    if (input.nextElementSibling) {
        var errorField = input.nextElementSibling;
        errorField.textContent = error;
    }
    else {
        console.error("No sibling element for input. Contact the front-end devs with this error");
    }
}
exports.setInvalid = setInvalid;
function passwordsEqual(passwordField, passwordConfirmField) {
    if (passwordField.value === passwordConfirmField.value) {
        setValid(passwordConfirmField);
        return true;
    }
    else {
        setInvalid(passwordConfirmField, "Passwords do not match");
        return false;
    }
}
exports.passwordsEqual = passwordsEqual;
function validEmail(field) {
    var emailPattern = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    var utwentePattern = /.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl$/;
    var email = field.value;
    if (emailPattern.test(email)) {
        if (utwentePattern.test(email)) {
            setValid(field);
            return true;
        }
        else {
            setInvalid(field, "Not a valid utwente.nl address");
        }
    }
    else {
        setInvalid(field, "Not a valid e-mail address");
    }
    return false;
}
exports.validEmail = validEmail;
function validPassword(field) {
    var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    var password = field.value;
    if (passwordPattern.test(password)) {
        setValid(field);
        return true;
    }
    else {
        setInvalid(field, "Password does not meet the requirements");
        return false;
    }
}
exports.validPassword = validPassword;
function checkFields() {
    var a = validEmail(registerEmailField); // Can't use a one-line function here due to lazy evaluation
    var b = validPassword(registerPasswordField);
    var c = passwordsEqual(registerPasswordField, registerPasswordConfirmField);
    return a && b && c;
}
function tryRegister() {
    return __awaiter(this, void 0, void 0, function () {
        var credentials, tempAlert, response, responseData, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!checkFields()) return [3 /*break*/, 5];
                    credentials = { email: registerEmailField.value, password: registerPasswordField.value };
                    tempAlert = alert_1.addTempAlert();
                    registerEmailField.disabled = true;
                    registerPasswordField.disabled = true;
                    registerPasswordConfirmField.disabled = true;
                    registerButton.disabled = true;
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, 4, 5]);
                    return [4 /*yield*/, axios_1.default.post("/rest/dbmusers/", credentials)];
                case 2:
                    response = _a.sent();
                    responseData = response.data;
                    alert_1.addAlert("Please check your inbox to confirm your e-mail", alert_1.AlertType.success, tempAlert);
                    return [3 /*break*/, 5];
                case 3:
                    error_1 = _a.sent();
                    alert_1.addErrorAlert(error_1, tempAlert);
                    return [3 /*break*/, 5];
                case 4:
                    registerEmailField.disabled = false;
                    registerPasswordField.disabled = false;
                    registerPasswordConfirmField.disabled = false;
                    registerButton.disabled = false;
                    return [7 /*endfinally*/];
                case 5: return [2 /*return*/];
            }
        });
    });
}
window.onload = function () {
    if (content) {
        content.addEventListener("submit", function (event) {
            event.preventDefault();
            tryRegister();
        });
    }
};
//# sourceMappingURL=register.js.map