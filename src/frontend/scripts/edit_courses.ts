import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {Course, getCoursesPromise, InputCourse, StudentDatabase} from "./courses";
import {setInvalid, setValid} from "./register";
import {changePageState, getWhoamiPromise, initNavbar, navbarEditCourses, Who} from "./navbar";
import {displayCourses} from "./student_view";
import * as $ from "jquery";


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
const newSchemaTransfer = document.getElementById("new-schema-transfer") as HTMLSelectElement;

const newSchemaTextareaDiv = document.getElementById("new-schema-textarea-div") as HTMLDivElement;
const newSchemaUploadDiv = document.getElementById("new-schema-upload-div") as HTMLDivElement;
const newSchemaTransferDiv = document.getElementById("new-schema-transfer-div") as HTMLDivElement;

const newCourseContent = document.getElementById('new-course-content') as HTMLFormElement;
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

async function fillStudentDatabasesDropdown(): Promise<void> {
    const response = await axios.get("/rest/studentdatabases/") as AxiosResponse<StudentDatabase[]>;
    const databases: StudentDatabase[] = (response.data).sort( (a: StudentDatabase, b: StudentDatabase) => a.databasename.localeCompare(b.databasename)  );

    while (newSchemaTransfer.lastElementChild !== newSchemaTransfer.firstElementChild) {
        const child: Element = newSchemaTransfer.lastElementChild!;
        newSchemaTransfer.removeChild(child!);
    }
    for (let i = 0; i < databases.length; i++) {
        const optionNode = document.createElement("option");
        optionNode.setAttribute("value", String(databases[i].dbid));
        optionNode.appendChild(document.createTextNode(databases[i].databasename));

        newSchemaTransfer.appendChild(optionNode)
        // result.push("<option value='" + courses[i].courseid + "'>" + courses[i].coursename + "</option>")
    }
    // const resultString: string = result.join("\n");
    // coursesDropdown.innerHTML += resultString;
}

function populateNewCoursePane(): void {
    newCourseFIDField.value = "";
    newCourseInfoField.value = "";
    newCoursenameField.value = "";
    newActiveField.checked = true;

    newSchemaRadioUpload.checked = false;
    newSchemaRadioTransfer.checked = false;
    newSchemaRadioTextarea.checked = false;
    newSchemaRadioNone.checked = true;

    newSchemaTextarea.value = "";
    newSchemaUpload.value = "";
    fillStudentDatabasesDropdown();

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
    if (Number(select) > 0) {
        setValid(select);
        return true;
    } else {
        setInvalid(select, "Please select a value from this dropdown");
        return false;
    }
}

function validUpload(uploadElement: HTMLInputElement): boolean {
    if (uploadElement.files === null || uploadElement.files.length === 0) {
        setInvalid(uploadElement, "Please select a file");
        return false;
    } else {
        setValid(uploadElement);
        return true;
    }
}

function checkFields(): boolean {
    setValid(newCourseInfoField);
    const a = validCoursename(newCoursenameField);
    const b = validFID(newCourseFIDField);
    let c = false;
    if (newSchemaRadioNone.checked) {
        c = true;
    } else if (newSchemaRadioTextarea.checked) {
        c = nonEmptyTextarea(newSchemaTextarea)
    } else if (newSchemaRadioUpload) {
        c = validUpload(newSchemaUpload)
    } else if (newSchemaRadioTransfer) {
        c = validSelect(newSchemaTransfer)
    }
    return a && b && c
}

function changeEditCoursesState(enable: boolean): void {
    // TODO update with new elements and check commented things

    if (enable) {
        newCourseInfoField.disabled = false;
        newCoursenameField.disabled = false;
        newCourseFIDField.disabled = false;
        newSchemaTextarea.disabled = false;
        newActiveField.disabled = false;
        // addCourseButton.disabled = false;
        (navbarEditCourses.firstElementChild)!.classList.add("disabled");
    } else {
        newCourseInfoField.disabled = true;
        newCoursenameField.disabled = true;
        newCourseFIDField.disabled = true;
        newSchemaTextarea.disabled = true;
        newActiveField.disabled = true;
        // addCourseButton.disabled = true;
    }
}

async function getSchema(): Promise<string> {
    if (newSchemaRadioTextarea.checked) {
        return (newSchemaTextarea.value as string)
    } else if (newSchemaRadioTransfer.checked) {
        return ""
        // TODO get id in the same way courses does it
        // TODO call schema transfer
    } else if (newSchemaRadioUpload.checked && newSchemaUpload.files) {
        const file: File = newSchemaUpload.files[0];
        const data: string = await new Response(file).text();
        return data;

        // https://stackoverflow.com/questions/36665322/js-get-file-contents
    }
    return "";

}

async function tryAddSchema(): Promise<void> {
    if (checkFields()) {
        changePageState(false, changeEditCoursesState);
        const tempAlert: ChildNode | null = addTempAlert();

        const inputCourse: InputCourse = {
            coursename: newCoursenameField.value,
            info: newCourseInfoField.value,
            active: newActiveField.checked
        };

        if (newCourseFIDField.value !== "") {
            inputCourse.fid = Number(newCourseFIDField.value)
        }
        const schema: string = await getSchema();

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
            changePageState(true, changeEditCoursesState);

        }
    }
}

window.onload = async () => {
    who = await getWhoamiPromise();
    await Promise.all([
        populateNewCoursePane(),

        initNavbar(changeEditCoursesState),
        newCourseContent.addEventListener("submit", (event) => {
            event.preventDefault();
            tryAddSchema();
        }),

        newSchemaRadioNone.parentElement!.addEventListener("click", () => {
            newSchemaTextareaDiv.classList.add("d-none");
            newSchemaTransferDiv.classList.add("d-none");
            newSchemaUploadDiv.classList.add("d-none");
        }),

        newSchemaRadioTextarea.parentElement!.addEventListener("click", () => {
            newSchemaTextareaDiv.classList.remove("d-none");
            newSchemaTransferDiv.classList.add("d-none");
            newSchemaUploadDiv.classList.add("d-none");
        }),


        newSchemaRadioTransfer.parentElement!.addEventListener("click", () => {
            newSchemaTextareaDiv.classList.add("d-none");
            newSchemaTransferDiv.classList.remove("d-none");
            newSchemaUploadDiv.classList.add("d-none");
        }),

        newSchemaRadioUpload.parentElement!.addEventListener("click", () => {
            newSchemaTextareaDiv.classList.add("d-none");
            newSchemaTransferDiv.classList.add("d-none");
            newSchemaUploadDiv.classList.remove("d-none");
        }),

        navbarEditCourses.classList.add("active"),
        (navbarEditCourses.firstElementChild)!.classList.add("disabled"),
        displayCourses(who.role)
    ])
    ;

    $('select').selectpicker(); // TODO maybe remove this line as it can break selects

};