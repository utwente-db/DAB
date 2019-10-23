import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {Course, getCoursesPromise, InputCourse} from "./courses";
import {setInvalid, setValid} from "./register";
import {changePageState, getWhoamiPromise, initNavbar, navbarEditCourses, Who} from "./navbar";
import {displayCourses} from "./student_view";

const addCourseButton = document.getElementById("add-course-button") as HTMLButtonElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const coursenameField = document.getElementById("course-name-field") as HTMLInputElement;
const courseInfoField = document.getElementById("course-info-field") as HTMLInputElement;
const courseFIDfield = document.getElementById("course-fid-field") as HTMLInputElement;
const schemaField = document.getElementById("schema-field") as HTMLTextAreaElement;
const activeField = document.getElementById("active-field") as HTMLInputElement;

const content = document.getElementById('content') as HTMLFormElement;
let who: Who;
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
    const a = validCoursename(coursenameField);
    const b = validFID(courseFIDfield);
    return a && b
}

function changeEditCoursesState(enable: boolean): void {
    if (enable) {
        courseInfoField.disabled = false;
        coursenameField.disabled = false;
        courseFIDfield.disabled = false;
        schemaField.disabled = false;
        activeField.disabled = false;
        addCourseButton.disabled = false;
        (navbarEditCourses.firstElementChild)!.classList.add("disabled");
    } else {
        courseInfoField.disabled = true;
        coursenameField.disabled = true;
        courseFIDfield.disabled = true;
        schemaField.disabled = true;
        activeField.disabled = true;
        addCourseButton.disabled = true;
    }
}

async function tryAddSchema(): Promise<void> {
    if (checkFields()) {
        changePageState(false,changeEditCoursesState);
        const tempAlert: ChildNode | null = addTempAlert();

        const inputCourse: InputCourse = {
            coursename: coursenameField.value,
            info: courseInfoField.value,
            active: activeField.checked
        };

        if (courseFIDfield.value !== "") {
            inputCourse.fid = Number(courseFIDfield.value)
        }
        //  TODO add schema field in obj? doesnt work right now

        const schema = schemaField.value;

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
        // TODO maak displaycourses grijze achtergrond als course disabled is
        // TODO ook bij teacher
        // TODO do dit ook bij student view
        // TODO maak displaycourses en grijsgroen als hij van jou is maar disabled
    ]);
};