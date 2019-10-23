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
var alert_1 = require("./alert");
var axios_1 = require("axios");
var register_1 = require("./register");
var newPasswordButton = document.getElementById("new-password-button");
var oldPasswordField = document.getElementById("old-password-field");
var newPasswordField = document.getElementById("new-password-field");
var confirmPasswordField = document.getElementById("confirm-password-field");
var content = document.getElementById('content');
var homepageRef = document.getElementById("homepage-ref");
function checkFields() {
    var a = register_1.validPassword(oldPasswordField); // Can't use a one-line function here due to lazy evaluation
    var b = register_1.validPassword(newPasswordField);
    var c = register_1.passwordsEqual(newPasswordField, confirmPasswordField);
    return a && b && c;
}
function tryResetPassword() {
    return __awaiter(this, void 0, void 0, function () {
        var tempAlert, error_1, ae;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!checkFields()) return [3 /*break*/, 6];
                    newPasswordField.disabled = true;
                    oldPasswordField.disabled = true;
                    confirmPasswordField.disabled = true;
                    newPasswordButton.disabled = true;
                    homepageRef.toggleAttribute("href");
                    tempAlert = alert_1.addTempAlert();
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 4, 5, 6]);
                    return [4 /*yield*/, axios_1.default.post("/change_password/", { 'current': oldPasswordField.value, 'new': newPasswordField.value })];
                case 2:
                    _a.sent();
                    if (tempAlert && document.body.contains(tempAlert)) {
                        tempAlert.remove();
                    }
                    alert_1.addTempAlert("Your password has been changed. You will soon be redirected to the homepage.", alert_1.AlertType.success, false, 0);
                    return [4 /*yield*/, new Promise(function (resolve) { return setTimeout(resolve, 3000); })];
                case 3:
                    _a.sent();
                    window.location.href = "/";
                    return [3 /*break*/, 6];
                case 4:
                    error_1 = _a.sent();
                    ae = error_1;
                    if (ae.response && ae.response.status === 403) {
                        alert_1.addAlert("The password entered in the current password field is incorrect", alert_1.AlertType.danger, tempAlert);
                    }
                    else {
                        alert_1.addErrorAlert(error_1, tempAlert);
                    }
                    return [3 /*break*/, 6];
                case 5:
                    newPasswordField.disabled = false;
                    oldPasswordField.disabled = false;
                    confirmPasswordField.disabled = false;
                    newPasswordButton.disabled = false;
                    homepageRef.toggleAttribute("href");
                    return [7 /*endfinally*/];
                case 6: return [2 /*return*/];
            }
        });
    });
}
window.onload = function () {
    content.addEventListener("submit", function (event) {
        event.preventDefault();
        tryResetPassword();
    });
};
//# sourceMappingURL=change_password.js.map