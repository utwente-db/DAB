import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {Course, getCoursesPromise, InputCourse, StudentDatabase} from "./courses";
import {setInvalid, setValid} from "./register";
import {changePageState, getWhoamiPromise, initNavbar, navbarEditCourses, Who} from "./navbar";
import {displayCourses} from "./student_view";

let addCourseLink = document.getElementById("add-course-link") as HTMLAnchorElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;

const existingCoursePane = document.getElementById("existing-course-pane") as HTMLDivElement;
const newCoursePane = document.getElementById("new-course-pane") as HTMLDivElement;


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

const addCourseButton = document.getElementById("add-course-button") as HTMLButtonElement;

const existingCourseIDField = document.getElementById("existing-course-id-field") as HTMLInputElement;
const existingCoursenameField = document.getElementById("existing-course-name-field") as HTMLInputElement;
const existingCourseInfoField = document.getElementById("existing-course-info-field") as HTMLInputElement;
const existingCourseFIDField = document.getElementById("existing-course-fid-field") as HTMLInputElement;
const existingActiveField = document.getElementById("existing-active-field") as HTMLInputElement;

const existingSchemaRadioNone = document.getElementById("existing-schema-radio-none") as HTMLInputElement;
const existingSchemaRadioTextarea = document.getElementById("existing-schema-radio-textarea") as HTMLInputElement;
const existingSchemaRadioUpload = document.getElementById("existing-schema-radio-upload") as HTMLInputElement;
const existingSchemaRadioTransfer = document.getElementById("existing-schema-radio-transfer") as HTMLInputElement;

const existingSchemaTextarea = document.getElementById("existing-schema-textarea") as HTMLTextAreaElement;
const existingSchemaUpload = document.getElementById("existing-schema-upload") as HTMLInputElement;
const existingSchemaTransfer = document.getElementById("existing-schema-transfer") as HTMLSelectElement;

const existingSchemaTextareaDiv = document.getElementById("existing-schema-textarea-div") as HTMLDivElement;
const existingSchemaUploadDiv = document.getElementById("existing-schema-upload-div") as HTMLDivElement;
const existingSchemaTransferDiv = document.getElementById("existing-schema-transfer-div") as HTMLDivElement;
const existingCourseContent = document.getElementById('existing-course-content') as HTMLFormElement;

const editCourseButton = document.getElementById("edit-course-button") as HTMLButtonElement;


let databases: StudentDatabase[];
let who: Who;
let courses: Course[];
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

async function fillStudentDatabasesDropdown(dropdown: HTMLSelectElement): Promise<void> {
    try {
        const response = await axios.get("/rest/studentdatabases/") as AxiosResponse<StudentDatabase[]>;
        databases = (response.data).sort((a: StudentDatabase, b: StudentDatabase) => a.databasename.localeCompare(b.databasename));

        while (dropdown.lastElementChild !== dropdown.firstElementChild) {
            const child: Element = dropdown.lastElementChild!;
            dropdown.removeChild(child!);
        }
        for (let i = 0; i < databases.length; i++) {
            const optionNode = document.createElement("option");
            optionNode.setAttribute("value", String(databases[i].dbid));
            optionNode.appendChild(document.createTextNode(databases[i].databasename));

            dropdown.appendChild(optionNode)
            // result.push("<option value='" + courses[i].courseid + "'>" + courses[i].coursename + "</option>")
        }
        // const resultString: string = result.join("\n");
        // coursesDropdown.innerHTML += resultString;
    } catch (error) {
        addErrorAlert(error)
    }
}

function populateNewCoursePane(): void {
    Array.from(coursesNavHtml.children).forEach((child) => {
        child.classList.remove("active");
    });

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
    fillStudentDatabasesDropdown(newSchemaTransfer);

}

function goToAddCoursePane(event: Event): void {
    event.preventDefault();
    populateNewCoursePane();
    if (addCourseLink) {
        const addcourseLinkClone = addCourseLink!.cloneNode(true) as HTMLAnchorElement;
        addCourseLink.parentNode!.replaceChild(addcourseLinkClone, addCourseLink);
        addCourseLink = addcourseLinkClone;
        addCourseLink.toggleAttribute("href");
    }
    Array.from(coursesContentHtml.children).forEach((child) => {
        child.classList.remove("active");
    });
    newCoursePane.classList.add("active");
}

async function populateExistingCoursePane(i: number): Promise<void> {
    existingCourseIDField.value = String(courses[i].courseid);
    existingCourseFIDField.value = String(courses[i].fid);
    existingCourseInfoField.value = courses[i].info
    existingCoursenameField.value = courses[i].coursename;
    existingActiveField.checked = courses[i].active;

    existingSchemaRadioUpload.checked = false;
    existingSchemaRadioTransfer.checked = false;
    existingSchemaRadioTextarea.checked = false;
    existingSchemaRadioNone.checked = true;

    existingSchemaTextarea.value = "";
    existingSchemaUpload.value = "";
    fillStudentDatabasesDropdown(existingSchemaTransfer);
}

export function goToExistingCoursePane(i: number): void {
    if (addCourseLink) {
        addCourseLink.addEventListener("click", goToAddCoursePane);
        addCourseLink.toggleAttribute("href");
    }

    populateExistingCoursePane(i);

    Array.from(coursesContentHtml.children).forEach((child) => {
        child.classList.remove("active");
    });
    existingCoursePane.classList.add("active");
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
    if (Number(select.value) > 0) {
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
    } else if (newSchemaRadioUpload.checked) {
        c = validUpload(newSchemaUpload)
    } else if (newSchemaRadioTransfer.checked) {
        c = validSelect(newSchemaTransfer)
    }
    return a && b && c
}

function changeEditCoursesState(enable: boolean): void {
    // TODO update with new elements
    // TODO disable all nav elements like in sutdent view
    // TODO addCoursesLink

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

async function getSchema(): Promise<string> {
    if (newSchemaRadioTextarea.checked) {
        return (newSchemaTextarea.value as string)
    } else if (newSchemaRadioUpload.checked && newSchemaUpload.files) {
        const file: File = newSchemaUpload.files[0];
        return (await new Response(file)).text();

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

        try {

            const response = await axios.post(`/rest/courses/`, inputCourse) as AxiosResponse<Course>;
            const course: Course = response.data;
            addAlert("Successfully created course (without schema)", AlertType.success, tempAlert);
            const courseID = course.courseid;
            const schema: string = await getSchema();

            if (schema !== "") {

                const response = await axios.post(`/rest/courses/${courseID}/schema`, schema);
                addAlert("successfully added schema", AlertType.success);


            } else if (newSchemaRadioTransfer.checked) {
                const dbid = Number(newSchemaTransfer.value);
                await axios.post(`/rest/schematransfer/${courseID}/${dbid}`);
                addAlert("Successfully added schema", AlertType.success);
            }
            populateNewCoursePane();
            courses.push(response.data);
            courses = courses.sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));
            goToExistingCoursePane(courses.indexOf(course))
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            changePageState(true, changeEditCoursesState);

        }
    }
}

window.onload = async () => {
    await Promise.all([
        (async () => {
            who = await getWhoamiPromise();
            courses = (await getCoursesPromise()).sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));
            await displayCourses(courses, who, true)

        })(),

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

        existingSchemaRadioNone.parentElement!.addEventListener("click", () => {
            existingSchemaTextareaDiv.classList.add("d-none");
            existingSchemaTransferDiv.classList.add("d-none");
            existingSchemaUploadDiv.classList.add("d-none");
        }),

        existingSchemaRadioTextarea.parentElement!.addEventListener("click", async () => {
            // existingSchemaTextarea.value = (await axios.get(`/rest/courses/${existingCourseIDField.value}/schema/`) as AxiosResponse<string>).data;

            existingSchemaTextareaDiv.classList.remove("d-none");
            existingSchemaTransferDiv.classList.add("d-none");
            existingSchemaUploadDiv.classList.add("d-none");
        }),


        existingSchemaRadioTransfer.parentElement!.addEventListener("click", () => {

            existingSchemaTextareaDiv.classList.add("d-none");
            existingSchemaTransferDiv.classList.remove("d-none");
            existingSchemaUploadDiv.classList.add("d-none");

        }),

        existingSchemaRadioUpload.parentElement!.addEventListener("click", () => {
            existingSchemaTextareaDiv.classList.add("d-none");
            existingSchemaTransferDiv.classList.add("d-none");
            existingSchemaUploadDiv.classList.remove("d-none");
        }),
        (() => {
            if (addCourseLink) {
                addCourseLink.addEventListener("click", goToAddCoursePane)
            }
        })(),


        populateNewCoursePane(),


        navbarEditCourses.classList.add("active"),
        (navbarEditCourses.firstElementChild)!.classList.add("disabled"),

    ])


};