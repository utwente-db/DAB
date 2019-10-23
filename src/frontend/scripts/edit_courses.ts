import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {Course, getCoursesPromise, InputCourse} from "./courses";
import {setInvalid, setValid} from "./register";
import {changePageState, initNavbar, navbarEditCourses} from "./navbar";

const addCourseButton = document.getElementById("add-course-button") as HTMLButtonElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const coursenameField = document.getElementById("course-name-field") as HTMLInputElement;
const courseInfoField = document.getElementById("course-info-field") as HTMLInputElement;
const courseFIDfield = document.getElementById("course-fid-field") as HTMLInputElement;
const schemaField = document.getElementById("schema-field") as HTMLTextAreaElement;
const activeField = document.getElementById("active-field") as HTMLInputElement;

const content = document.getElementById('content') as HTMLFormElement;

// const homepageRef = document.getElementById("homepage-ref") as HTMLAnchorElement;

async function displayCourses(): Promise<void> {
    const courses: Course[] = await getCoursesPromise();
    const resultNav: string[] = [];
    const resultContent: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        let active = "";
        if (i === 0) {
            active = " active";
        }
        resultNav.push(
            "<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + i + "\">" + courses[i].coursename + "</a>"
        );
        resultContent.push(
            "<div class=\"tab-pane" + active + "\" id=\"course" + i + "\">"
            + "<ul><li>ID: " + courses[i].courseid + "</li>"
            + "<li>FID: " + courses[i].fid + "</li>"
            + "<li>Coursename: " + courses[i].coursename + "</li>"
            + "<li>Info: " + courses[i].info + "</li></ul>"
            + "<a class=\"btn btn-secondary\" href=\"/courses#" + courses[i].courseid + "\" role=\"button\">Edit Course</a></div>"
        );
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    coursesNavHtml.innerHTML = resultNavString;
    coursesContentHtml.innerHTML = resultContentString;
}

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
    await Promise.all([
        initNavbar(changeEditCoursesState),
        content.addEventListener("submit", (event) => {
            event.preventDefault();
            tryAddSchema();
        }),
        navbarEditCourses.classList.add("active"),
        (navbarEditCourses.firstElementChild)!.classList.add("disabled"),
        displayCourses()
    ]);
};