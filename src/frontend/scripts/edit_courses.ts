import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {Course, getCoursesPromise, InputCourse} from "./courses";
import {setInvalid, setValid} from "./register";
import {changePageState, getWhoamiPromise, initNavbar, navbarEditCourses, Who} from "./navbar";
import {displayCourses} from "./student_view";

const addCourseButton = document.getElementById("add-course-button") as HTMLButtonElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const newCoursesContentHtml: HTMLDivElement = document.getElementById("new-courses-content") as HTMLDivElement;
const newCoursenameField = document.getElementById("new-course-name-field") as HTMLInputElement;
const newCourseInfoField = document.getElementById("new-course-info-field") as HTMLInputElement;
const newCourseFIDField = document.getElementById("new-course-fid-field") as HTMLInputElement;
const newActiveField = document.getElementById("new-active-field") as HTMLInputElement;


const newSchemaRadioNone = document.getElementById("new-schema-radio-none") as HTMLInputElement;
const newSchemaRadioTextarea = document.getElementById("new-schema-radio-textarea") as HTMLInputElement;
const newSchemaRadioUpload = document.getElementById("new-schema-radio-upload") as HTMLInputElement;
const newSchemaRadioTransfer = document.getElementById("new-schema-radio-transfer") as HTMLInputElement;


const newSchemaTextarea = document.getElementById("new-schema-textarea") as HTMLTextAreaElement;
const newSchemaUpload = document.getElementById("new-schema-upload") as HTMLInputElement;
const newSchemaTransfer = document.getElementById("new-schema-textarea") as HTMLSelectElement;


const content = document.getElementById('content') as HTMLFormElement;
let who: Who;
// tslint:disable-next-line:prefer-const
let currentCourse = 0;

// const homepageRef = document.getElementById("homepage-ref") as HTMLAnchorElement;

function validCoursename(field: HTMLInputElement): boolean {
    const coursenameRegex = /^[a-zA-Z0-9\.\-\+\/ ]+$/
    if (coursenameRegex.test(field.value)) {
        setValid(field);
        return true
    } else {
        setInvalid(field, "Coursename can only contain alphanumerical and these: .-+/ characters, as well as spaces")
        return false
    }
}

function depopulateNewCoursePane(): void {
    newCourseFIDField.value="";
    newCourseInfoField.value="";
    newCoursenameField.value="";
    newSchemaTextarea.value="";
    newActiveField.checked=true;
    // TODO rename fields that i addded new in front of
    // TODO Depopulate other fields (schema and such)
}

export function populateExistingCoursePane(): void {
    // TODO implement
}

function validFID(field: HTMLInputElement): boolean {
    try {
        if (field.value === "" || Number(field.value) > 0) {
            setValid(field);
            return true
        } else {
            setInvalid(field, "Please enter a valid integer")
            return false
        }
    } catch (error) {
        // Probably failed to convert to a number
        addErrorAlert(error);
        return false
    }
}

function nonEmptyTextarea(newSchemaTextarea: HTMLTextAreaElement): boolean {
    if (newSchemaTextarea.value === "") {
        setInvalid(newSchemaTextarea, "Please enter a valid string or select not to add a schema");
        return false;
    } else {
        setValid(newSchemaTextarea)
        return true;
    }
}

function validSelect(select: HTMLSelectElement): boolean {
    if (Number(select)>0) {
        setValid(select);
        return true;
    } else {
        setInvalid(select,"Please select a value from this dropdown");
        return false;
    }
}

function validUpload(uploadElement: HTMLInputElement): boolean {
            // TODO check if upload is non empty

    // https://stackoverflow.com/questions/3292658/get-the-value-of-input-type-file-and-alert-if-empty
    return false;
}

function checkFields(): boolean {
    const a = validCoursename(newCoursenameField);
    const b = validFID(newCourseFIDField);
    let c: boolean;
    if (newSchemaRadioNone.checked) {
        c = true;
    } else if (newSchemaRadioTextarea.checked) {
        c = nonEmptyTextarea(newSchemaTextarea)
    } else if (newSchemaRadioUpload) {
        c = validUpload(newSchemaRadioUpload)
    } else if (newSchemaRadioTransfer) {
        c = validSelect(newSchemaTransfer)
    }
    return a && b && c
}

function changeEditCoursesState(enable: boolean): void {
    if (enable) {
        newCourseInfoField.disabled = false;
        newCoursenameField.disabled = false;
        newCourseFIDField.disabled = false;
        newSchemaTextarea.disabled = false;
        newActiveField.disabled = false;
        addCourseButton.disabled = false;
        (navbarEditCourses.firstElementChild)!.classList.add("disabled");
    } else {
        newCourseInfoField.disabled = true;
        newCoursenameField.disabled = true;
        newCourseFIDField.disabled = true;
        newSchemaTextarea.disabled = true;
        newActiveField.disabled = true;
        addCourseButton.disabled = true;
    }
}

function getSchema(): string {
    if (newSchemaRadioNone.checked) {return "";}
    else if (newSchemaRadioTextarea.checked) {return newSchemaTextarea.value}
    else if (newSchemaRadioTransfer.checked) {
        // TODO get id in the same way courses does it
        // TODO call schema transfer
    }
    else if (newSchemaRadioUpload.checked) {
        // TODO return file contents as string
        // https://stackoverflow.com/questions/36665322/js-get-file-contents
    }
}

async function tryAddSchema(): Promise<void> {
    if (checkFields()) {
        changePageState(false,changeEditCoursesState);
        const tempAlert: ChildNode | null = addTempAlert();

        const inputCourse: InputCourse = {
            coursename: newCoursenameField.value,
            info: newCourseInfoField.value,
            active: newActiveField.checked
        };

        if (newCourseFIDField.value !== "") {
            inputCourse.fid = Number(newCourseFIDField.value)
        }
        const schema: string = getSchema();

        try {

            const response = await axios.post(`/rest/courses/`, inputCourse) as AxiosResponse<Course>;
            addAlert("successfully added course, but not schema yet", AlertType.success);
            const courseID = response.data.courseid;
            if (schema !== "") {
                const response = await axios.post(`/rest/courses/${courseID}/schema`, schema);
                addAlert("successfully added schema", AlertType.success);
            }
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            changePageState(true,changeEditCoursesState);

        }
    }
}

window.onload = async () => {
    who = await getWhoamiPromise();
    await Promise.all([
        initNavbar(changeEditCoursesState),
        content.addEventListener("submit", (event) => {
            event.preventDefault();
            tryAddSchema();
        }),
        navbarEditCourses.classList.add("active"),
        (navbarEditCourses.firstElementChild)!.classList.add("disabled"),
        displayCourses(who.role)
    ]);
};