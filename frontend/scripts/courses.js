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
var axios_1 = require("axios");
var $ = require("jquery");
require("popper.js");
require("bootstrap");
require("bootstrap-select");
var alert_1 = require("./alert");
var navbar_1 = require("./navbar");
var credentialsButton = document.getElementById("credentials-button");
var coursesDropdown = document.getElementById("courses-dropdown");
var alertDiv = document.getElementById("alert-div");
var groupInput = document.getElementById("group-input");
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
exports.getCoursesPromise = getCoursesPromise;
function displayCourses() {
    return __awaiter(this, void 0, void 0, function () {
        var courses, result, i, optionNode;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getCoursesPromise()];
                case 1:
                    courses = _a.sent();
                    result = [];
                    for (i = 0; i < courses.length; i++) {
                        optionNode = document.createElement("option");
                        optionNode.setAttribute("value", String(courses[i].courseid));
                        optionNode.appendChild(document.createTextNode(courses[i].coursename));
                        coursesDropdown.appendChild(optionNode);
                        // result.push("<option value='" + courses[i].courseid + "'>" + courses[i].coursename + "</option>")
                    }
                    return [2 /*return*/];
            }
        });
    });
}
function tryGetCredentials(courseID, groupNumber, alert) {
    if (alert === void 0) { alert = true; }
    return __awaiter(this, void 0, void 0, function () {
        var data, tempAlert, response, database, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!(courseID !== 0)) return [3 /*break*/, 8];
                    if (!(groupNumber > 0)) return [3 /*break*/, 6];
                    data = { "course": courseID, "groupid": groupNumber };
                    tempAlert = alert_1.addTempAlert();
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 4, , 5]);
                    return [4 /*yield*/, axios_1.default.post("/rest/studentdatabases/", data)];
                case 2:
                    response = _a.sent();
                    return [4 /*yield*/, response.data];
                case 3:
                    database = _a.sent();
                    if (alert) {
                        alert_1.addAlert("Database generated for course \"" + database.course + "\".<br>\n                                                                   Username: \"" + database.username + "\"<br>\n                                                                   Password: \"" + database.password + "\"", alert_1.AlertType.success, tempAlert);
                    }
                    else {
                        if (tempAlert) {
                            tempAlert.remove();
                        }
                    }
                    return [2 /*return*/, true];
                case 4:
                    error_1 = _a.sent();
                    alert_1.addErrorAlert(error_1, tempAlert);
                    return [3 /*break*/, 5];
                case 5: return [3 /*break*/, 7];
                case 6:
                    alert_1.addAlert("Please enter a valid group number", alert_1.AlertType.danger);
                    _a.label = 7;
                case 7: return [3 /*break*/, 9];
                case 8:
                    alert_1.addAlert("Please select a course", alert_1.AlertType.danger);
                    _a.label = 9;
                case 9: return [2 /*return*/, false];
            }
        });
    });
}
exports.tryGetCredentials = tryGetCredentials;
window.onload = function () { return __awaiter(void 0, void 0, void 0, function () {
    var _a, _b, _c;
    return __generator(this, function (_d) {
        switch (_d.label) {
            case 0:
                _b = (_a = Promise).all;
                _c = [navbar_1.displayWhoami()];
                return [4 /*yield*/, displayCourses()];
            case 1: return [4 /*yield*/, _b.apply(_a, [_c.concat([_d.sent(),
                        $('select').selectpicker(),
                        credentialsButton.addEventListener("click", function () {
                            tryGetCredentials(Number(coursesDropdown.value), Number(groupInput.value));
                        })])])];
            case 2:
                _d.sent();
                return [2 /*return*/];
        }
    });
}); };
//# sourceMappingURL=courses.js.map