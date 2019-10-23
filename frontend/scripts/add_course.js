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
var addCourseButton = document.getElementById("add-course-button");
var coursenameField = document.getElementById("course-name-field");
var courseInfoField = document.getElementById("course-info-field");
var courseFIDfield = document.getElementById("course-fid-field");
var schemaField = document.getElementById("schema-field");
var activeField = document.getElementById("active-field");
var content = document.getElementById('content');
// const homepageRef = document.getElementById("homepage-ref") as HTMLAnchorElement;
function validCoursename(field) {
    var coursenameRegex = /^[a-zA-Z0-9\.\-\+\/ ]+$/;
    if (coursenameRegex.test(field.value)) {
        register_1.setValid(field);
        return true;
    }
    else {
        register_1.setInvalid(field, "Coursename can only contain alphanumerical and these: .-+/ characters, as well as spaces");
        return false;
    }
}
function validFID(field) {
    try {
        if (field.value === "" || Number(field.value) > 0) {
            register_1.setValid(field);
            return true;
        }
        else {
            register_1.setInvalid(field, "Please enter a valid integer");
            return false;
        }
    }
    catch (error) {
        // Probably failed to convert to a number
        alert_1.addErrorAlert(error);
        return false;
    }
}
function checkFields() {
    var a = validCoursename(coursenameField);
    var b = validFID(courseFIDfield);
    return a && b;
}
function tryAddSchema() {
    return __awaiter(this, void 0, void 0, function () {
        var tempAlert, inputCourse, schema, response, courseID, response_1, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!checkFields()) return [3 /*break*/, 7];
                    courseInfoField.disabled = true;
                    coursenameField.disabled = true;
                    courseFIDfield.disabled = true;
                    schemaField.disabled = true;
                    activeField.disabled = true;
                    addCourseButton.disabled = true;
                    tempAlert = alert_1.addTempAlert();
                    inputCourse = {
                        coursename: coursenameField.value,
                        info: courseInfoField.value,
                        active: activeField.checked
                    };
                    if (courseFIDfield.value !== "") {
                        inputCourse.fid = Number(courseFIDfield.value);
                    }
                    schema = schemaField.value;
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 5, 6, 7]);
                    return [4 /*yield*/, axios_1.default.post("/rest/courses/", inputCourse)];
                case 2:
                    response = _a.sent();
                    alert_1.addAlert("successfully added course, but not schema yet", alert_1.AlertType.success);
                    courseID = response.data.courseid;
                    if (!(schema !== "")) return [3 /*break*/, 4];
                    return [4 /*yield*/, axios_1.default.post("/rest/courses/" + courseID + "/schema", schema)];
                case 3:
                    response_1 = _a.sent();
                    alert_1.addAlert("successfully added schema", alert_1.AlertType.success);
                    _a.label = 4;
                case 4: return [3 /*break*/, 7];
                case 5:
                    error_1 = _a.sent();
                    alert_1.addErrorAlert(error_1, tempAlert);
                    return [3 /*break*/, 7];
                case 6:
                    courseInfoField.disabled = false;
                    coursenameField.disabled = false;
                    courseFIDfield.disabled = false;
                    schemaField.disabled = false;
                    activeField.disabled = false;
                    addCourseButton.disabled = false;
                    return [7 /*endfinally*/];
                case 7: return [2 /*return*/];
            }
        });
    });
}
window.onload = function () {
    content.addEventListener("submit", function (event) {
        event.preventDefault();
        tryAddSchema();
    });
};
//# sourceMappingURL=add_course.js.map