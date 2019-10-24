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
const newSchemaField = document.getElementById("new-schema-field") as HTMLTextAreaElement;
const newActiveField = document.getElementById("new-active-field") as HTMLInputElement;

const content = document.getElementById('content') as HTMLFormElement;
let who: Who;
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
    newSchemaField.value="";
    newActiveField.checked=true;
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

function checkFields(): boolean {
    const a = validCoursename(newCoursenameField);
    const b = validFID(newCourseFIDField);
    return a && b
}

function changeEditCoursesState(enable: boolean): void {
    if (enable) {
        newCourseInfoField.disabled = false;
        newCoursenameField.disabled = false;
        newCourseFIDField.disabled = false;
        newSchemaField.disabled = false;
        newActiveField.disabled = false;
        addCourseButton.disabled = false;
        (navbarEditCourses.firstElementChild)!.classList.add("disabled");
    } else {
        newCourseInfoField.disabled = true;
        newCoursenameField.disabled = true;
        newCourseFIDField.disabled = true;
        newSchemaField.disabled = true;
        newActiveField.disabled = true;
        addCourseButton.disabled = true;
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
        const schema = newSchemaField.value;

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