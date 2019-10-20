import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {Course, InputCourse} from "./courses";
import {setInvalid, setValid} from "./register";

const addCourseButton = document.getElementById("add-course-button") as HTMLButtonElement;

const coursenameField = document.getElementById("course-name-field") as HTMLInputElement;
const courseInfoField = document.getElementById("course-info-field") as HTMLInputElement;
const courseFIDfield = document.getElementById("course-fid-field") as HTMLInputElement;
const schemaField = document.getElementById("schema-field") as HTMLInputElement;
const activeField = document.getElementById("active-field") as HTMLInputElement;

const content = document.getElementById('content') as HTMLFormElement;

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

function validcourseInfo(field: HTMLInputElement): boolean {
    // TODO implement
    return true
}

function validFID(field: HTMLInputElement): boolean {
    // TODO make FID field integer like group input on student_view
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

function validSchema(field: HTMLInputElement): boolean {
    // TODO Do we need this?
    return true
}

function checkFields(): boolean {
    const a = validCoursename(coursenameField);
    const b = validcourseInfo(courseInfoField);
    const c = validFID(courseFIDfield);// todo what is an FID even?
    const d = validSchema(schemaField);
    return a && b && c && d
}

async function tryAddSchema(): Promise<void> {
    if (checkFields()) {
        courseInfoField.disabled = true;
        coursenameField.disabled = true;
        courseFIDfield.disabled = true;
        schemaField.disabled = true;
        activeField.disabled = true;
        addCourseButton.disabled = true;
        const tempAlert: ChildNode | null = addTempAlert();

        const inputCourse: InputCourse = {
            coursename: coursenameField.value,
            info: courseInfoField.value,
            active: Boolean(activeField.value)
        };

        if (courseFIDfield.value !== "") {inputCourse.fid = Number(courseFIDfield.value)}
        //  TODO add schema field in obj? doesnt work right now

        const schema = schemaField.value; // TODO actually do some verifying here

        try {

            const response = await axios.post(`/rest/courses/`, inputCourse) as AxiosResponse<Course>;
            addAlert("successfully added course, but not schema yet", AlertType.success);
            const courseID = response.data.courseid;
            if (schemaField.value !== "") {
                await axios.post(`/rest/courses/${courseID}/schema`, schema)
                addAlert("successfully added schema", AlertType.success);
            }


            // TODO Maybe clear fields
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            courseInfoField.disabled = false;
            coursenameField.disabled = false;
            courseFIDfield.disabled = false;
            schemaField.disabled = false;
            activeField.disabled = false;
            addCourseButton.disabled = false;

        }
    }
}

window.onload = () => {
    content.addEventListener("submit", (event) => {
        event.preventDefault();
        tryAddSchema();
    });
};