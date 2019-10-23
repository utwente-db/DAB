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
var navbar_1 = require("./navbar");
require("popper.js");
require("bootstrap");
var user_1 = require("./user");
var courses_1 = require("./courses");
var usersHtml = document.getElementById("users");
var coursesNavHtml = document.getElementById("courses-nav");
var coursesContentHtml = document.getElementById("courses-content");
var filterForm = document.getElementById("filter-form");
function displayCourses() {
    return __awaiter(this, void 0, void 0, function () {
        var courses, resultNav, resultContent, i, active, resultNavString, resultContentString;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, courses_1.getCoursesPromise()];
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
                    coursesNavHtml.innerHTML = resultNavString;
                    coursesContentHtml.innerHTML = resultContentString;
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
                case 0: return [4 /*yield*/, user_1.getUsersPromise()];
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
                            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage?id=" + users[i].id + "\">" + role + "</td>"
                            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage?id=" + users[i].id + "\">" + users[i].email + "</td>"
                            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage?id=" + users[i].id + "\">" + verified + "</td></tr>");
                    }
                    resultString = result.join("\n");
                    usersHtml.innerHTML = resultString;
                    return [2 /*return*/];
            }
        });
    });
}
window.onload = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, Promise.all([
                    // filterForm.addEventListener("submit", (event) => {
                    //     event.preventDefault();
                    //     TODO actually figure out how to include filter here
                    // }),
                    navbar_1.displayWhoami(),
                    displayUsers(),
                    displayCourses()
                ])];
            case 1:
                _a.sent();
                return [2 /*return*/];
        }
    });
}); };
//# sourceMappingURL=admin.js.map