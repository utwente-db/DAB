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
var courses_1 = require("./courses");
var navbar_1 = require("./navbar");
var axios_1 = require("axios");
require("popper.js");
require("bootstrap");
var alert_1 = require("./alert");
var sweetalert2_1 = require("sweetalert2");
var coursesNavHtml = document.getElementById("courses-nav");
var coursesContentHtml = document.getElementById("courses-content");
var noCredsCoursename = document.getElementById("no-credentials-coursename");
var noCredsInfo = document.getElementById("no-credentials-courseinfo");
var haveCredsCoursename = document.getElementById("have-credentials-coursename");
var haveCredsInfo = document.getElementById("have-credentials-courseinfo");
var credentialsDiv = document.getElementById("credentials-div");
var haveCredsPane = document.getElementById("have-credentials-pane");
var noCredsPane = document.getElementById("no-credentials-pane");
var credentialsButton = document.getElementById("credentials-button");
var groupInput = document.getElementById("group-input");
var alertDiv = document.getElementById("alert-div");
var ownDatabases;
var courses;
var currentCourse = 0;
function populateNoCredentialsPane(i) {
    noCredsCoursename.innerText = courses[i].coursename;
    noCredsInfo.innerText = courses[i].info;
    groupInput.value = "";
}
function populateHaveCredentialsPane(i) {
    return __awaiter(this, void 0, void 0, function () {
        var credentials, dbIDs;
        return __generator(this, function (_a) {
            credentials = "";
            dbIDs = [];
            haveCredsCoursename.innerText = courses[i].coursename;
            haveCredsInfo.innerText = courses[i].info;
            ownDatabases.forEach(function (db) {
                if (db.course === courses[i].courseid) {
                    var html = "<div class=\"mt-5 form-group row\">\n                            <label class=\"col-12 col-md-4 col-form-label\">Username:</label>\n                            <div class=\"col-12 col-md-8\">\n                                <input type=\"text\" class=\"form-control\" value=\"" + db.username + "\" readonly=\"\">\n                            </div>\n                        </div>\n                        <div class=\"form-group row\">\n                            <label class=\"col-12 col-md-4 col-form-label\">Password:</label>\n                            <div class=\"col-12 col-md-8\">\n                                <input type=\"text\" class=\"form-control\" value=\"" + db.password + "\" readonly=\"\">\n                            </div>\n                        </div>\n                        <div class=\"align-items-center align-items-stretch row\">\n                            <div class=\"center-block col-12 col-md-4 my-2 my-md-4 d-flex\">\n                                <button id=\"delete-button-" + db.dbid + "\" class=\"btn btn-danger delete-button btn-block\">Delete database and release credentials</button>\n                            </div>\n                            <div class=\"center-block col-12 col-md-4 my-2 my-md-4 d-flex\">\n                                <button id=\"reset-button-" + db.dbid + "\" class=\"btn btn-info reset-button btn-block\">Reset database</button>\n                            </div>\n                            <div class=\"center-block col-12 col-md-4 my-2 my-md-4 d-flex\">\n                                <button onclick=\"window.open('/rest/dump/" + db.dbid + "/')\" id=\"dump-button-" + db.dbid + "\" class=\"btn btn-secondary dump-button btn-block\">Get dump of database</button>\n                            </div>\n                        </div>\n                        <hr>";
                    // TODO make third button mobile-friendly
                    credentials += html.trim();
                    dbIDs.push(db.dbid);
                }
            });
            credentialsDiv.innerHTML = credentials;
            dbIDs.forEach(function (id) {
                var deleteButton = document.getElementById("delete-button-" + id);
                var resetButton = document.getElementById("reset-button-" + id);
                deleteButton.addEventListener("click", function () {
                    prepareToDeleteCredentials(id);
                });
                resetButton.addEventListener("click", function () {
                    resetDatabase(id);
                });
            });
            return [2 /*return*/];
        });
    });
}
function createNavLink(haveCredentials, i, active) {
    if (active === void 0) { active = false; }
    var credentialsClass = haveCredentials ? "have-credentials-nav" : "no-credentials-nav";
    var hrefString = haveCredentials ? "have-credentials-pane" : "no-credentials-pane";
    var activeString = active ? "active" : "";
    var templateString = "<a id=\"" + i + "\" class=\"nav-link " + credentialsClass + " " + activeString + "\" data-toggle=\"pill\" href=\"#" + hrefString + "\">" + courses[i].coursename + "</a>";
    var fragment = document.createRange().createContextualFragment(templateString);
    if (!haveCredentials) {
        fragment.firstChild.addEventListener("click", function () {
            populateNoCredentialsPane(i);
        });
    }
    else {
        fragment.firstChild.addEventListener("click", function () {
            populateHaveCredentialsPane(i);
        });
    }
    fragment.firstChild.addEventListener("click", function () {
        currentCourse = courses[i].courseid;
        alertDiv.innerHTML = ""; // Remove all alerts when switching course
    });
    return fragment;
}
function displayCourses() {
    return __awaiter(this, void 0, void 0, function () {
        var ownCourses, resultNav, i, haveCredentials, fragment;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, courses_1.getCoursesPromise()];
                case 1:
                    courses = (_a.sent()).sort(function (a, b) { return a.coursename.localeCompare(b.coursename); });
                    return [4 /*yield*/, axios_1.default.get("/rest/studentdatabases/own/")];
                case 2: return [4 /*yield*/, (_a.sent()).data];
                case 3:
                    ownDatabases = (_a.sent());
                    ownCourses = ownDatabases.map(function (db) { return db.course; });
                    console.log(ownCourses);
                    resultNav = [];
                    for (i = 0; i < courses.length; i++) {
                        haveCredentials = (ownCourses.includes(courses[i].courseid));
                        fragment = createNavLink(haveCredentials, i);
                        coursesNavHtml.appendChild(fragment);
                    }
                    return [2 /*return*/];
            }
        });
    });
}
function changeViewToHaveCredentials() {
    return __awaiter(this, void 0, void 0, function () {
        var activeLink, i, fragment;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    activeLink = document.getElementsByClassName("nav-link active")[0];
                    i = Number(activeLink.id);
                    fragment = createNavLink(true, i, true);
                    activeLink.classList.remove("active");
                    activeLink.insertAdjacentElement("afterend", fragment.firstElementChild);
                    activeLink.remove();
                    return [4 /*yield*/, axios_1.default.get("/rest/studentdatabases/own/")];
                case 1:
                    ownDatabases = (_a.sent()).data;
                    noCredsPane.classList.remove("active");
                    haveCredsPane.classList.add("active");
                    populateHaveCredentialsPane(i);
                    return [2 /*return*/];
            }
        });
    });
}
function prepareToGetCredentials() {
    return __awaiter(this, void 0, void 0, function () {
        var success, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    coursesNavHtml.childNodes.forEach(function (node) { return node.classList.add("disabled"); });
                    credentialsButton.classList.add("disabled");
                    groupInput.classList.add("disabled");
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 5, 6, 7]);
                    return [4 /*yield*/, courses_1.tryGetCredentials(currentCourse, Number(groupInput.value), false)];
                case 2:
                    success = _a.sent();
                    if (!success) return [3 /*break*/, 4];
                    return [4 /*yield*/, changeViewToHaveCredentials()];
                case 3:
                    _a.sent();
                    _a.label = 4;
                case 4:
                    ;
                    return [3 /*break*/, 7];
                case 5:
                    error_1 = _a.sent();
                    alert_1.addErrorAlert(error_1);
                    return [3 /*break*/, 7];
                case 6:
                    coursesNavHtml.childNodes.forEach(function (node) { return node.classList.remove("disabled"); });
                    credentialsButton.classList.remove("disabled");
                    groupInput.classList.remove("disabled");
                    return [7 /*endfinally*/];
                case 7: return [2 /*return*/];
            }
        });
    });
}
function changeViewToNoCredentials() {
    return __awaiter(this, void 0, void 0, function () {
        var activeLink, i, fragment;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    activeLink = document.getElementsByClassName("nav-link active")[0];
                    i = Number(activeLink.id);
                    fragment = createNavLink(false, i, true);
                    activeLink.classList.remove("active");
                    activeLink.insertAdjacentElement("afterend", fragment.firstElementChild);
                    activeLink.remove();
                    return [4 /*yield*/, axios_1.default.get("/rest/studentdatabases/own/")];
                case 1:
                    ownDatabases = (_a.sent()).data;
                    haveCredsPane.classList.remove("active");
                    noCredsPane.classList.add("active");
                    populateNoCredentialsPane(i);
                    return [2 /*return*/];
            }
        });
    });
}
function prepareToDeleteCredentials(dbID) {
    return __awaiter(this, void 0, void 0, function () {
        var result, success, error_2;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, sweetalert2_1.default.fire({
                        title: 'Are you sure you want to delete this database?',
                        text: 'You will not be able to recover your data!',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Delete',
                        cancelButtonText: 'Cancel'
                    })];
                case 1:
                    result = _a.sent();
                    if (result.dismiss === sweetalert2_1.default.DismissReason.cancel) {
                        return [2 /*return*/, false];
                    }
                    coursesNavHtml.childNodes.forEach(function (node) { return node.classList.add("disabled"); });
                    Array.from(document.getElementsByClassName("delete-button"))
                        .forEach(function (deleteButton) {
                        deleteButton.classList.add("disabled");
                    });
                    Array.from(document.getElementsByClassName("reset-button"))
                        .forEach(function (resetButton) {
                        resetButton.classList.add("disabled");
                    });
                    _a.label = 2;
                case 2:
                    _a.trys.push([2, 4, 5, 6]);
                    return [4 /*yield*/, axios_1.default.delete("/rest/studentdatabases/" + dbID + "/")];
                case 3:
                    _a.sent();
                    // await changeViewToHaveCredentials()
                    alert_1.addAlert("Deleted database", alert_1.AlertType.primary);
                    changeViewToNoCredentials();
                    success = true;
                    return [3 /*break*/, 6];
                case 4:
                    error_2 = _a.sent();
                    alert_1.addErrorAlert(error_2);
                    success = false;
                    return [3 /*break*/, 6];
                case 5:
                    coursesNavHtml.childNodes.forEach(function (node) { return node.classList.remove("disabled"); });
                    Array.from(document.getElementsByClassName("delete-button"))
                        .forEach(function (deleteButton) {
                        deleteButton.classList.remove("disabled");
                    });
                    Array.from(document.getElementsByClassName("reset-button"))
                        .forEach(function (resetButton) {
                        resetButton.classList.remove("disabled");
                    });
                    return [7 /*endfinally*/];
                case 6: return [2 /*return*/, success];
            }
        });
    });
}
function resetDatabase(dbID) {
    return __awaiter(this, void 0, void 0, function () {
        var result, success, error_3;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, sweetalert2_1.default.fire({
                        title: 'Are you sure you want to reset this database?',
                        text: 'You will not be able to recover your data!',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Reset',
                        cancelButtonText: 'Cancel'
                    })];
                case 1:
                    result = _a.sent();
                    if (result.dismiss === sweetalert2_1.default.DismissReason.cancel) {
                        return [2 /*return*/, false];
                    }
                    coursesNavHtml.childNodes.forEach(function (node) { return node.classList.add("disabled"); });
                    Array.from(document.getElementsByClassName("delete-button"))
                        .forEach(function (deleteButton) {
                        deleteButton.classList.add("disabled");
                    });
                    Array.from(document.getElementsByClassName("reset-button"))
                        .forEach(function (resetButton) {
                        resetButton.classList.add("disabled");
                    });
                    _a.label = 2;
                case 2:
                    _a.trys.push([2, 4, 5, 6]);
                    return [4 /*yield*/, axios_1.default.post("/rest/reset/" + dbID + "/")];
                case 3:
                    _a.sent();
                    alert_1.addAlert("Reset database", alert_1.AlertType.primary);
                    success = true;
                    return [3 /*break*/, 6];
                case 4:
                    error_3 = _a.sent();
                    alert_1.addErrorAlert(error_3);
                    success = false;
                    return [3 /*break*/, 6];
                case 5:
                    coursesNavHtml.childNodes.forEach(function (node) { return node.classList.remove("disabled"); });
                    Array.from(document.getElementsByClassName("delete-button"))
                        .forEach(function (deleteButton) {
                        deleteButton.classList.remove("disabled");
                    });
                    Array.from(document.getElementsByClassName("reset-button"))
                        .forEach(function (resetButton) {
                        resetButton.classList.remove("disabled");
                    });
                    return [7 /*endfinally*/];
                case 6: return [2 /*return*/, success];
            }
        });
    });
}
window.onload = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, Promise.all([
                    credentialsButton.addEventListener("click", prepareToGetCredentials),
                    displayCourses(),
                    navbar_1.displayWhoami()
                ])];
            case 1:
                _a.sent();
                return [2 /*return*/];
        }
    });
}); };
//# sourceMappingURL=student_view.js.map