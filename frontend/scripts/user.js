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
var axios_1 = require("axios");
require("popper.js");
require("bootstrap");
var alert_1 = require("./alert");
var sweetalert2_1 = require("sweetalert2");
var navbar_1 = require("./navbar");
//todo: change to selected user ofcourse
var urlParams = new URLSearchParams(window.location.search);
var userid = 0;
// let user: User;
// let databases: Database[];
var x = urlParams.get("id");
if (x != null) {
    userid = Number(x);
}
var pageTitleHtml = document.getElementById("page-title");
var userInfoHtml = document.getElementById("user-info");
var coursesNavHtml = document.getElementById("courses-nav");
var courseDatabasesHtml = document.getElementById("courses-db");
var usernameHtml = document.getElementById("username");
var roleHtml = document.getElementById("role");
var verifiedHtml = document.getElementById("verified");
var deleteButton = document.getElementById("delete_button");
var changeRoleButton = document.getElementById("change_role");
var UserRole;
(function (UserRole) {
    UserRole[UserRole["admin"] = 0] = "admin";
    UserRole[UserRole["teacher"] = 1] = "teacher";
    UserRole[UserRole["student"] = 2] = "student";
})(UserRole = exports.UserRole || (exports.UserRole = {}));
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
exports.getUsersPromise = getUsersPromise;
function getDatabasesPromise() {
    return __awaiter(this, void 0, void 0, function () {
        var response;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, axios_1.default.get("/rest/studentdatabases/owner/" + userid + "/")];
                case 1:
                    response = _a.sent();
                    return [2 /*return*/, response.data];
            }
        });
    });
}
function getCourseByIDPromise(id) {
    return __awaiter(this, void 0, void 0, function () {
        var response;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, axios_1.default.get("/rest/courses/" + id + "/")];
                case 1:
                    response = _a.sent();
                    return [2 /*return*/, response.data];
            }
        });
    });
}
function getUserPromise() {
    return __awaiter(this, void 0, void 0, function () {
        var path, response;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    path = "/rest/dbmusers/" + userid + "/";
                    return [4 /*yield*/, axios_1.default.get(path)];
                case 1:
                    response = _a.sent();
                    return [2 /*return*/, response.data];
            }
        });
    });
}
function displayCoursesAndDatabases() {
    return __awaiter(this, void 0, void 0, function () {
        var databases, coursesAndDatabases, i, i, html, resultNav, resultContent, active, _i, _a, entry, courseNumber, content, course, resultNavString, resultContentString;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0: return [4 /*yield*/, getDatabasesPromise()];
                case 1:
                    databases = _b.sent();
                    coursesAndDatabases = new Map();
                    if (databases.length === 0) {
                        coursesNavHtml.innerHTML = "empty";
                        courseDatabasesHtml.innerHTML = "no content";
                        return [2 /*return*/];
                    }
                    // const coursesAndDatabases = new Map<number, string>();
                    for (i = 0; i < databases.length; i++) {
                        coursesAndDatabases.set(databases[i].course, "");
                    }
                    for (i = 0; i < databases.length; i++) {
                        html = "dbid: " + databases[i].dbid + "<br>"
                            + "databasename: " + databases[i].databasename + "<br>"
                            + "username: " + databases[i].username + "<br>"
                            + "password: " + databases[i].password + "<br>"
                            + "groupid: " + databases[i].groupid + "<br>"
                            + "fid: " + databases[i].fid + "<br>"
                            + "course: " + databases[i].course + "<br>";
                        // This will mess up if someone has multiple db's in a single course
                        coursesAndDatabases.set(databases[i].course, html);
                    }
                    resultNav = [];
                    resultContent = [];
                    active = " active";
                    _i = 0, _a = Array.from(coursesAndDatabases.entries());
                    _b.label = 2;
                case 2:
                    if (!(_i < _a.length)) return [3 /*break*/, 5];
                    entry = _a[_i];
                    courseNumber = entry[0];
                    content = entry[1];
                    return [4 /*yield*/, getCourseByIDPromise(courseNumber)];
                case 3:
                    course = _b.sent();
                    resultNav.push("<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + course.courseid + "\">" + course.coursename + "</a>");
                    resultContent.push("<div class=\"tab-pane" + active + "\" id=\"course" + course.courseid + "\">"
                        + content
                        + "test</div>");
                    active = "";
                    _b.label = 4;
                case 4:
                    _i++;
                    return [3 /*break*/, 2];
                case 5:
                    resultNavString = resultNav.join("\n");
                    resultContentString = resultContent.join("\n");
                    coursesNavHtml.innerHTML = resultNavString;
                    courseDatabasesHtml.innerHTML = resultContentString;
                    return [2 /*return*/];
            }
        });
    });
}
function displayUserDetails() {
    return __awaiter(this, void 0, void 0, function () {
        var user, role;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getUserPromise()];
                case 1:
                    user = _a.sent();
                    pageTitleHtml.innerHTML += "Admin - User " + user.id;
                    if (user.role === UserRole.admin) {
                        role = "admin";
                    }
                    else if (user.role === UserRole.teacher) {
                        role = "teacher";
                    }
                    else if (user.role === UserRole.student) {
                        role = "student";
                    }
                    else {
                        role = "unknown";
                    }
                    usernameHtml.innerHTML += "<input type=\"text\" class=\"form-control\" value=\"" + user.email + "\" readonly=\"\">";
                    roleHtml.innerHTML += "<input type=\"text\" class=\"form-control\" value=\"" + role + "\" readonly=\"\">";
                    verifiedHtml.innerHTML += (user.verified ? "<span>&#x2714</span>" : "<span>&#x2718</span>");
                    return [2 /*return*/];
            }
        });
    });
}
function deleteUser() {
    return __awaiter(this, void 0, void 0, function () {
        var user, result, success, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getUserPromise()];
                case 1:
                    user = _a.sent();
                    return [4 /*yield*/, sweetalert2_1.default.fire({
                            text: "Are you sure you want to delete <strong>" + user.email + "</strong> from the system?",
                            type: 'warning',
                            showCancelButton: true,
                            focusCancel: true,
                            confirmButtonText: 'Delete',
                            cancelButtonText: 'Cancel'
                        })];
                case 2:
                    result = _a.sent();
                    if (result.dismiss === sweetalert2_1.default.DismissReason.cancel) {
                        return [2 /*return*/, false];
                    }
                    _a.label = 3;
                case 3:
                    _a.trys.push([3, 5, , 6]);
                    return [4 /*yield*/, axios_1.default.delete("/rest/dbmusers/" + userid + "/")];
                case 4:
                    _a.sent();
                    alert("User succesfully deleted!");
                    window.location.href = '../';
                    success = true;
                    return [3 /*break*/, 6];
                case 5:
                    error_1 = _a.sent();
                    alert_1.addErrorAlert(error_1);
                    success = false;
                    return [3 /*break*/, 6];
                case 6: return [2 /*return*/, success];
            }
        });
    });
}
function changeRole() {
    return __awaiter(this, void 0, void 0, function () {
        var user, selectedRole, role, result, success, error_2;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, getUserPromise()];
                case 1:
                    user = _a.sent();
                    selectedRole = document.getElementById("selected_role");
                    role = selectedRole.value;
                    return [4 /*yield*/, sweetalert2_1.default.fire({
                            text: "Are you sure you want change the role of <strong>" + user.email + "</strong> to " + role + "?",
                            type: 'warning',
                            showCancelButton: true,
                            focusCancel: true,
                            confirmButtonText: 'Confirm',
                            cancelButtonText: 'Cancel'
                        })];
                case 2:
                    result = _a.sent();
                    if (result.dismiss === sweetalert2_1.default.DismissReason.cancel) {
                        return [2 /*return*/, false];
                    }
                    _a.label = 3;
                case 3:
                    _a.trys.push([3, 5, , 6]);
                    return [4 /*yield*/, axios_1.default.post("/rest/set_role", {
                            user: user.id,
                            role: Number(role)
                        })];
                case 4:
                    _a.sent();
                    window.location.reload(true);
                    alert_1.addAlert("Role changed!", alert_1.AlertType.primary);
                    success = true;
                    return [3 /*break*/, 6];
                case 5:
                    error_2 = _a.sent();
                    alert_1.addErrorAlert(error_2);
                    success = false;
                    return [3 /*break*/, 6];
                case 6: return [2 /*return*/, success];
            }
        });
    });
}
window.onload = function () { return __awaiter(void 0, void 0, void 0, function () {
    var _a, _b, _c;
    return __generator(this, function (_d) {
        switch (_d.label) {
            case 0:
                _b = (_a = Promise).all;
                _c = [changeRoleButton.addEventListener("click", changeRole),
                    deleteButton.addEventListener("click", deleteUser)];
                return [4 /*yield*/, displayUserDetails()];
            case 1:
                _c = _c.concat([
                    _d.sent()
                ]);
                return [4 /*yield*/, navbar_1.displayWhoami()];
            case 2:
                _c = _c.concat([
                    _d.sent()
                ]);
                return [4 /*yield*/, displayCoursesAndDatabases()];
            case 3: return [4 /*yield*/, _b.apply(_a, [_c.concat([
                        _d.sent()
                    ])])];
            case 4:
                _d.sent();
                return [2 /*return*/];
        }
    });
}); };
//# sourceMappingURL=user.js.map