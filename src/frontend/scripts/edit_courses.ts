import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse, urlPrefix} from "./main";
import Swal from "sweetalert2";
import {Course, getCoursesPromise, InputCourse, StudentDatabase} from "./courses";
import {setInvalid, setNeutral, setValid} from "./register";
import {changePageState, getWhoPromise, initNavbar, navbarEditCourses, Who} from "./navbar";
import {displayCourses} from "./student_view";
import {deleteDatabase, resetDatabase, TA, User, UserRole} from "./user";
import autosize from "autosize"


const addCourseLink = document.getElementById("add-course-link") as HTMLAnchorElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;

const existingCoursePane = document.getElementById("existing-course-pane") as HTMLDivElement;
const newCoursePane = document.getElementById("new-course-pane") as HTMLDivElement;

const studentDatabasesNavHtml: HTMLDivElement = document.getElementById("studentdatabases-nav") as HTMLDivElement;
const courseDatabasesHtml: HTMLDivElement = document.getElementById("courses-db") as HTMLDivElement;

const taNav: HTMLDivElement = document.getElementById("TA-nav") as HTMLDivElement;
const taDiv: HTMLDivElement = document.getElementById("TA-div") as HTMLDivElement;

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
const newSchemaTransferCourseList = document.getElementById("new-schema-transfer-course-list") as HTMLSelectElement;
const newSchemaTransferDatabaseList = document.getElementById("new-schema-transfer-database-list") as HTMLSelectElement;
const newSchemaTransferRow = document.getElementById("new-schema-transfer-row") as HTMLSelectElement;

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

const existingSchemaTransferCourseList = document.getElementById("existing-schema-transfer-course-list") as HTMLSelectElement;
const existingSchemaTransferDatabaseList = document.getElementById("existing-schema-transfer-database-list") as HTMLSelectElement
const existingSchemaTransferRow = document.getElementById("existing-schema-transfer-row") as HTMLSelectElement


const existingSchemaTextareaDiv = document.getElementById("existing-schema-textarea-div") as HTMLDivElement;
const existingSchemaUploadDiv = document.getElementById("existing-schema-upload-div") as HTMLDivElement;
const existingSchemaTransferDiv = document.getElementById("existing-schema-transfer-div") as HTMLDivElement;
const existingCourseContent = document.getElementById('existing-course-content') as HTMLFormElement;

const editCourseButton = document.getElementById("edit-course-button") as HTMLButtonElement;
const deleteCourseButton = document.getElementById("delete-course-button") as HTMLButtonElement;
const dumpCourseButton = document.getElementById("dump-course-button") as HTMLButtonElement;


let who: Who;
let courses: Course[];
// tslint:disable-next-line:prefer-const
let currentCourse: Course;
let users: User[] = [];
let studentDatabases: StudentDatabase[] = [];
let tas: TA[] = [];
let ownDatabases: StudentDatabase[] = [];

// const homepageRef = document.getElementById("homepage-ref") as HTMLAnchorElement;

function validCoursename(field: HTMLInputElement): boolean {
    const coursenameRegex = /^[a-zA-Z0-9\.\-\+\/ ]+$/;
    if (coursenameRegex.test(field.value)) {
        setValid(field);
        return true
    } else {
        setInvalid(field, "Coursename can only contain alphanumerical and these: .-+/ characters, as well as spaces");
        return false
    }
}

async function fillStudentDatabasesDropdown(courseDropdown: HTMLSelectElement, databaseDropdown: HTMLSelectElement): Promise<void> {
    databaseDropdown.disabled = true;
    let displayDatabases: StudentDatabase[];
    let displayCourses: Course[];
    if (who.role === UserRole.Admin) {
        displayDatabases = studentDatabases;
        displayCourses = courses;
    } else {
        const ownedCourses: Course[] = courses.filter((course: Course) => course.fid === who.id);
        const ownDatabasesCourses: Course[] = ownDatabases.map((database: StudentDatabase) => courses.find(course => course.courseid === database.course)!);
        displayCourses = ownedCourses.concat(ownDatabasesCourses);

        if (who.role === UserRole.Teacher) {
            const ownedCoursesDatabases: StudentDatabase[] = studentDatabases;
            displayDatabases = ownDatabases.concat(ownedCoursesDatabases);
        } else {
           const currentCourseDatabases = studentDatabases.filter(db => db.course === Number(existingCourseIDField.value));
           displayDatabases = ownDatabases.concat(currentCourseDatabases);
            displayCourses.push(courses.find((course: Course) => course.courseid === Number(existingCourseIDField.value))!);
        }
        displayCourses = displayCourses.sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));
    }
    displayCourses = displayCourses.filter(course => displayDatabases.filter(db => db.course === course.courseid).length > 0);
    displayDatabases = displayDatabases.sort((a: StudentDatabase, b: StudentDatabase) => a.databasename.localeCompare(b.databasename));

    while (courseDropdown.lastElementChild !== courseDropdown.firstElementChild) {
        const child: Element = courseDropdown.lastElementChild!;
        courseDropdown.removeChild(child!);
    }

    while (databaseDropdown.lastElementChild !== databaseDropdown.firstElementChild) {
        const child: Element = databaseDropdown.lastElementChild!;
        databaseDropdown.removeChild(child!);
    }

    displayCourses.forEach(course => {
        const optionNode = document.createElement("option");
        optionNode.setAttribute("value", String(course.courseid));
        optionNode.appendChild(document.createTextNode(course.coursename));
        courseDropdown.appendChild(optionNode);
    });


    courseDropdown.addEventListener("change", () => {
        while (databaseDropdown.lastElementChild !== databaseDropdown.firstElementChild) {
            const child: Element = databaseDropdown.lastElementChild!;
            databaseDropdown.removeChild(child!);
        }
        databaseDropdown.disabled = false;
        databaseDropdown.value = String(0);

        const filteredDisplayDatabases = displayDatabases.filter(db => db.course === Number(courseDropdown.value))
        filteredDisplayDatabases.forEach(db => {
            const optionNode = document.createElement("option");
            optionNode.setAttribute("value", String(db.dbid));
            optionNode.appendChild(document.createTextNode(db.databasename));
            databaseDropdown.appendChild(optionNode);
        })
    })

}

function populateNewCoursePane(): void {
    Array.from(coursesNavHtml.children).forEach((child) => {
        child.classList.remove("active");
    });

    [newCourseFIDField, newCourseInfoField, newCoursenameField, newSchemaTextarea, newSchemaUpload, newSchemaTransferDatabaseList, newSchemaTransferCourseList].forEach((el) => {
        setNeutral(el);
    });

    newCourseFIDField.value = "";
    newCourseInfoField.value = "";
    newCoursenameField.value = "";
    newActiveField.checked = true;

    newSchemaRadioUpload.checked = false;
    newSchemaRadioTransfer.checked = false;
    newSchemaRadioTextarea.checked = false;
    newSchemaRadioNone.checked = true;

    newSchemaRadioUpload.parentElement!.classList.remove("active");
    newSchemaRadioTransfer.parentElement!.classList.remove("active");
    newSchemaRadioTextarea.parentElement!.classList.remove("active");
    newSchemaRadioNone.parentElement!.classList.add("active");

    newSchemaTextareaDiv.classList.add("d-none");
    newSchemaTransferDiv.classList.add("d-none");
    newSchemaUploadDiv.classList.add("d-none");
    newSchemaTextarea.value = "";
    newSchemaUpload.value = "";
    fillStudentDatabasesDropdown(newSchemaTransferCourseList, newSchemaTransferDatabaseList);
    newSchemaTransferCourseList.value = String(0);
    newSchemaTransferDatabaseList.value = String(0);


}

function goToAddCoursePane(event: Event): void {
    event.preventDefault();
    populateNewCoursePane();
    if (addCourseLink) {
        addCourseLink.setAttribute("style", "pointer-events: none;");
        addCourseLink.toggleAttribute("href", false);
    }
    Array.from(coursesContentHtml.children).forEach((child) => {
        child.classList.remove("active");
    });
    newCoursePane.classList.add("active");
}

async function populateExistingCoursePane(i: number): Promise<void> {
    studentDatabasesNavHtml.innerHTML = "";
    courseDatabasesHtml.innerHTML = "No database selected";
    if (who.role < UserRole.Student) {
        populateTAPane(i);
    }

    displayStudentDatabasesForCourse(i);
    [existingCourseFIDField, existingCourseInfoField, existingCoursenameField, existingSchemaTextarea, existingSchemaUpload, existingSchemaTransferDatabaseList, existingSchemaTransferCourseList].forEach((el) => {
        setNeutral(el);
    });

    currentCourse = courses[i];
    existingCourseIDField.setAttribute("value", String(courses[i].courseid));
    existingCourseFIDField.setAttribute("value", String(courses[i].fid));
    existingCourseInfoField.value = courses[i].info;
    existingCoursenameField.value = courses[i].coursename;
    existingActiveField.checked = courses[i].active;

    existingSchemaRadioUpload.checked = false;
    existingSchemaRadioTransfer.checked = false;
    existingSchemaRadioTextarea.checked = false;
    existingSchemaRadioNone.checked = true;

    existingSchemaRadioUpload.parentElement!.classList.remove("active");
    existingSchemaRadioTransfer.parentElement!.classList.remove("active");
    existingSchemaRadioTextarea.parentElement!.classList.remove("active");
    existingSchemaRadioNone.parentElement!.classList.add("active");

    existingSchemaTextareaDiv.classList.add("d-none");
    existingSchemaTransferDiv.classList.add("d-none");
    existingSchemaUploadDiv.classList.add("d-none");

    existingSchemaTextarea.value = "";
    existingSchemaUpload.value = "";
    fillStudentDatabasesDropdown(existingSchemaTransferCourseList, existingSchemaTransferDatabaseList);
    existingSchemaTransferCourseList.value = String(0);
    existingSchemaTransferDatabaseList.value = String(0);

}

export function goToExistingCoursePane(i: number): void {
    if (addCourseLink) {
        addCourseLink.removeAttribute("style");
        addCourseLink.toggleAttribute("href", true);
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
            setInvalid(field, "Please enter a valid integer");
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
        setValid(newSchemaTextarea);
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

function checkFields(newCourseInfoField: HTMLInputElement, newCoursenameField: HTMLInputElement, newCourseFIDField: HTMLInputElement,
                     newSchemaRadioNone: HTMLInputElement, newSchemaRadioTextarea: HTMLInputElement, newSchemaTextarea: HTMLTextAreaElement,
                     newSchemaRadioUpload: HTMLInputElement, newSchemaUpload: HTMLInputElement, newSchemaRadioTransfer: HTMLInputElement,
                     schemaTransfer1: HTMLSelectElement, schemaTransfer2: HTMLSelectElement): boolean {
    setValid(newCourseInfoField);
    const a = validCoursename(newCoursenameField);
    const b = validFID(newCourseFIDField);
    let c = true;
    let d = true;
    if (newSchemaRadioTextarea.checked) {
        c = nonEmptyTextarea(newSchemaTextarea)
    } else if (newSchemaRadioUpload.checked) {
        c = validUpload(newSchemaUpload)
    } else if (newSchemaRadioTransfer.checked) {
        c = validSelect(schemaTransfer1);
        d = validSelect(schemaTransfer2);
    }
    return a && b && c && d
}

function changeEditCoursesState(enable: boolean): void {
    const buttons: HTMLCollectionOf<HTMLButtonElement> = document.getElementsByTagName("button");
    const inputs: HTMLCollectionOf<HTMLInputElement> = document.getElementsByTagName("input");
    const selects: HTMLCollectionOf<HTMLSelectElement> = document.getElementsByTagName("select");
    const textAreas: HTMLCollectionOf<HTMLTextAreaElement> = document.getElementsByTagName("textarea");

    // const tableRows: HTMLCollectionOf<HTMLTableRowElement> = document.getElementsByTagName("tr");
    const navLinks = document.getElementsByClassName("nav-link") as HTMLCollectionOf<HTMLAnchorElement>;


    Array.from(buttons).forEach(button => button.disabled = !enable);
    Array.from(inputs).forEach(input => input.disabled = !enable);
    Array.from(selects).forEach(select => select.disabled = !enable);
    Array.from(textAreas).forEach(textArea => textArea.disabled = !enable);


    if (enable) {
        Array.from(navLinks).forEach(navLink => navLink.classList.remove("disabled"));
        if (addCourseLink && !newCoursePane.classList.contains("active")) {
            addCourseLink.removeAttribute("style");
            addCourseLink.toggleAttribute("href", true);
        }
        // Array.from(tableRows).forEach(tableRow => {
        //     tableRow.classList.add("not-disabled");
        //     tableRow.removeAttribute("style");
        // })

    } else {
        Array.from(navLinks).forEach(navLink => navLink.classList.add("disabled"));
        if (addCourseLink) {
            addCourseLink.setAttribute("style", "pointer-events: none;");
            addCourseLink.toggleAttribute("href", false);
        }
        // Array.from(tableRows).forEach(tableRow => {
        //     tableRow.classList.remove("not-disabled");
        //     tableRow.setAttribute("style","pointer-events: none;");
        // })
    }


}

async function getSchema(newSchemaRadioTextarea: HTMLInputElement, newSchemaTextarea: HTMLTextAreaElement, newSchemaRadioUpload: HTMLInputElement,
                         newSchemaUpload: HTMLInputElement): Promise<string> {
    if (newSchemaRadioTextarea.checked) {
        return (newSchemaTextarea.value as string)
    } else if (newSchemaRadioUpload.checked && newSchemaUpload.files) {
        const file: File = newSchemaUpload.files[0];
        return (await new Response(file)).text();

        // https://stackoverflow.com/questions/36665322/js-get-file-contents
    }
    return "";

}

async function tryAddCourse(): Promise<void> {
    if (checkFields(newCourseInfoField, newCoursenameField, newCourseFIDField,
        newSchemaRadioNone, newSchemaRadioTextarea, newSchemaTextarea,
        newSchemaRadioUpload, newSchemaUpload, newSchemaRadioTransfer,
        newSchemaTransferDatabaseList, newSchemaTransferCourseList)) {
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
            const schema: string = await getSchema(newSchemaRadioTextarea, newSchemaTextarea, newSchemaRadioUpload,
                newSchemaUpload);

            if (schema !== "") {

                await axios.post(`/rest/courses/${courseID}/schema`, schema);
                addAlert("successfully added schema", AlertType.success);


            } else if (newSchemaRadioTransfer.checked) {
                const dbid = Number(newSchemaTransferDatabaseList.value);
                await axios.post(`/rest/schematransfer/${courseID}/${dbid}`);
                addAlert("Successfully added schema", AlertType.success);
            }
            populateNewCoursePane();
            courses.push(response.data);

            while (coursesNavHtml.firstElementChild) {
                coursesNavHtml.removeChild(coursesNavHtml.firstElementChild)
            }
            courses = courses.sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));
            await displayCourses(courses, who, true, courses.indexOf(course));

            goToExistingCoursePane(courses.indexOf(course))
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            changePageState(true, changeEditCoursesState);

        }
    }
}

async function tryDeleteCourse(courseID: number): Promise<boolean> {
    // noinspection TypeScriptUnresolvedFunction
    const result = await Swal.fire({
        title: 'Are you sure you want to delete this course?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    // noinspection TypeScriptUnresolvedVariable
    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success: boolean;
    const tempAlert: ChildNode | null = addTempAlert();
    changePageState(false, changeEditCoursesState);
    try {
        await axios.delete(`/rest/courses/${courseID}/`);
        // await changeViewToHaveCredentials()
        addAlert("The course has been successfully deleted", AlertType.primary, tempAlert);
        // await changeView(false);
        // for (let i = 0; i < courses.length; i++) {
        //     if (courses[i].courseid === courseID) {
        //         courses.splice(i, 1)
        //     }
        // }
        // courses = courses.sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));

        document.getElementsByClassName("course-link nav-link active")[0].remove();
        Array.from(coursesContentHtml.children).forEach((child) => {
            child.classList.remove("active");
        });
        document.getElementById("please-select-a-course")!.classList.add("active");

        success = true;

    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, changeEditCoursesState);
    }
    return success;
}

async function tryEditCourse(): Promise<void> {


    if (checkFields(existingCourseInfoField, existingCoursenameField, existingCourseFIDField,
        existingSchemaRadioNone, existingSchemaRadioTextarea, existingSchemaTextarea,
        existingSchemaRadioUpload, existingSchemaUpload, existingSchemaRadioTransfer,
        existingSchemaTransferCourseList, existingSchemaTransferCourseList)) {

        changePageState(false, changeEditCoursesState);
        const tempAlert: ChildNode | null = addTempAlert();

        const inputCourse: Course = {
            courseid: Number(existingCourseIDField.value),
            coursename: existingCoursenameField.value,
            info: existingCourseInfoField.value,
            active: existingActiveField.checked,
            fid: Number(existingCourseFIDField.value)

        };


        try {
            const response = await axios.put(`/rest/courses/${existingCourseIDField.value}`, inputCourse) as AxiosResponse;
            addAlert("Successfully edited course (without schema)", AlertType.success, tempAlert);
            const schema: string = await getSchema(existingSchemaRadioTextarea, existingSchemaTextarea, existingSchemaRadioUpload,
                existingSchemaUpload);

            if (schema !== "") {

                await axios.post(`/rest/courses/${existingCourseIDField.value}/schema`, schema);
                addAlert("Successfully added schema", AlertType.success);


            } else if (existingSchemaRadioTransfer.checked) {
                const dbid = Number(existingSchemaTransferDatabaseList.value);
                await axios.post(`/rest/schematransfer/${existingCourseIDField.value}/${dbid}`);
                addAlert("Successfully added schema", AlertType.success);
            }
            const navLink = document.getElementsByClassName("course-link nav-link active")[0]! as HTMLAnchorElement;
            navLink.innerText = existingCoursenameField.value;
            courses[Number(navLink.id)] = inputCourse;
            goToExistingCoursePane(Number(navLink.id))
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            changePageState(true, changeEditCoursesState);

        }
    }

}

async function displayStudentDatabasesForCourse(i: number): Promise<void> {
    const databases: StudentDatabase[] = studentDatabases.filter(db => db.course === courses[i].courseid)

    const dbToHTMLmap: Map<StudentDatabase, string> = new Map<StudentDatabase, string>();
    if (databases.length === 0) {
        studentDatabasesNavHtml.innerHTML = "There are no databases for this course";
        return;
    }

    // const coursesAndDatabases = new Map<number, string>();

    for (let j = 0; j < databases.length; j++) {
        dbToHTMLmap.set(databases[j], "");
    }

    for (let j = 0; j < databases.length; j++) {
        const html: string =
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].dbid}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].databasename}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Username:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].username}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Password:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].password}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Group ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].groupid}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">FID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].fid}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Course ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].course}" readonly="">
                </div>
            </div>` +
            `<button type="button" class="btn btn-danger" onclick="window.location.replace('${urlPrefix}rest/dump/${databases[j].dbid}/')">
                Download Dump
            </button>` +
            `<button id="reset-button-${databases[j].dbid}" type="button" class="btn btn-danger">
                Reset
            </button>` +
            `<button id="delete-button-${databases[j].dbid}" type="button" class="btn btn-danger">
                Delete
            </button>`

        ;

        // This will mess up if someone has multiple db's for a single course
        dbToHTMLmap.set(databases[j], html);
    }

    for (const entry of Array.from(dbToHTMLmap.entries())) {
        const db: StudentDatabase = entry[0];
        const content: string = entry[1];


        const templateString = `<a class="studentdatabase-link nav-link" data-toggle="pill" href="#">${db.databasename}</a>`;
        const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

        fragment.firstElementChild!.addEventListener("click", (event) => {
            courseDatabasesHtml.innerHTML = content;

            const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${db.dbid}`) as HTMLButtonElement;
            resetButton.addEventListener("click", () => {
                resetDatabase(db.dbid);
            });
            const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${db.dbid}`) as HTMLButtonElement;
            deleteButton.addEventListener("click", () => {
                deleteDatabase(db.dbid, courseDatabasesHtml);
            });
        });


        studentDatabasesNavHtml.appendChild(fragment);


    }

}

async function makeUserTA(user: User, i: number): Promise<boolean> {
    const taObject: { studentid: number; courseid: number } = {
        "courseid": courses[i].courseid,
        "studentid": user.id
    }
    const tempAlert = addTempAlert();
    let success = false;
    changePageState(false, changeEditCoursesState);
    try {
        const response = await axios.post(`/rest/tas/`, taObject) as AxiosResponse<TA>;
        const ta = response.data;
        tas.push(ta);
        addAlert(`${user.email} was added as a TA`, AlertType.success, tempAlert);

        const templateString = `<a class="ta-link nav-link green-nav active" data-toggle="pill" href="#">${user.email}</a>`;
        const newFragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

        const activeLink: HTMLAnchorElement = document.getElementsByClassName("ta-link nav-link active")[0] as HTMLAnchorElement;

        activeLink.classList.remove("active");


        newFragment.firstElementChild!.addEventListener("click", (event) => {
            const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
            userTAButton.addEventListener("click", () => {
                removeTA(user, ta.taid, i);
            });
        });

        activeLink.insertAdjacentElement("afterend", newFragment.firstElementChild!);
        activeLink.remove();

        const taFragment = generateTaDivHTML(user, true);
        taDiv.innerHTML = taFragment;

        const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
        userTAButton.addEventListener("click", () => {
            removeTA(user, ta.taid, i);
        });

        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;

    } finally {
        changePageState(true, changeEditCoursesState);
    }
    return success;

}

async function removeTA(user: User, taID: number, i: number): Promise<boolean> {
    const tempAlert = addTempAlert();
    let success = false;
    changePageState(false, changeEditCoursesState);
    try {
        const response = await axios.delete(`/rest/tas/${taID}/`) as AxiosResponse;
        tas = tas.filter(ta => ta.taid !== taID);
        addAlert(`${user.email} is no longer a TA`, AlertType.success, tempAlert);

        const templateString = `<a class="ta-link nav-link not-green-nav active" data-toggle="pill" href="#">${user.email}</a>`;
        const newFragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

        const activeLink: HTMLAnchorElement = document.getElementsByClassName("ta-link nav-link active")[0] as HTMLAnchorElement;

        activeLink.classList.remove("active");


        newFragment.firstElementChild!.addEventListener("click", (event) => {
            const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
            userTAButton.addEventListener("click", () => {
                makeUserTA(user, i);
            });
        });

        activeLink.insertAdjacentElement("afterend", newFragment.firstElementChild!);
        activeLink.remove();

        const taFragment = generateTaDivHTML(user, false);
        taDiv.innerHTML = taFragment;

        const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
        userTAButton.addEventListener("click", () => {
            makeUserTA(user, i);
        });


        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;

    } finally {
        changePageState(true, changeEditCoursesState);
    }
    return success;
}

function generateTaDivHTML(user: User, userIsTaForCourse: boolean): string {
    const userIsTaString = userIsTaForCourse ? `<span class="text-success h5">${user.email} is a TA for this course</span>` :
        `<span class="text-danger h5">${user.email} is not a ${user.role < UserRole.Student ? "co-teacher" : "TA"} for this course</span>`
    const userTaButton = `<button class="btn btn-info" id="user-ta-button">Change user ${user.role < UserRole.Student ? "co-teacher" : "TA"} status</button>`
    const taDivHTML = `${userIsTaString}<br>
                           ${userTaButton}`.trim();
    return taDivHTML;
}

async function populateTAPane(i: number): Promise<void> {
    taDiv.innerHTML = "No user selected";
    if (users.length === 0) {
        taNav.innerHTML = "There are no users in the database."
    } else {
        taNav.innerHTML = "";
    }

    const taList = tas.filter(ta => ta.courseid === courses[i].courseid);
    // const response = await axios.get(`/rest/tas/course/${courses[i].courseid}`) as AxiosResponse<TA[]>;
    // const taList = response.data;
    const taListByUserID = taList.map((ta: TA) => ta.studentid);

    users.forEach((user: User) => {

        let taID = 0;
        const userIsTaForCourse = taListByUserID.includes(user.id);
        if (userIsTaForCourse) {
            taID = taList[taListByUserID.indexOf(user.id)].taid
        }


        const greenClass = userIsTaForCourse ? "green-nav" : "not-green-nav";
        const templateString = `<a class="ta-link nav-link ${greenClass}" data-toggle="pill" href="#">${user.email}</a>`;
        const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);


        const taDivHTML = generateTaDivHTML(user, userIsTaForCourse);


        fragment.firstElementChild!.addEventListener("click", (event) => {
            taDiv.innerHTML = taDivHTML;
        });

        if (userIsTaForCourse) {

            fragment.firstElementChild!.addEventListener("click", (event) => {
                const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
                userTAButton.addEventListener("click", () => {
                    removeTA(user, taID, i);
                });
            });
        } else {
            fragment.firstElementChild!.addEventListener("click", (event) => {
                const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
                userTAButton.addEventListener("click", () => {
                    makeUserTA(user, i);
                });
            });

        }
        taNav.appendChild(fragment);

    });


}

function tryDumpCourse(id: number): void {
    window.location.href = urlPrefix + `rest/course_dump/${id}`;
}

window.onload = async () => {
    who = await getWhoPromise();
    if (who.role === UserRole.Admin) {
        studentDatabases = (await axios.get("/rest/studentdatabases/") as AxiosResponse<StudentDatabase[]>).data;
    } else if (who.role === UserRole.Teacher) {
        studentDatabases = (await axios.get("/rest/studentdatabases/teacher/own") as AxiosResponse<StudentDatabase[]>).data;
    } else {
        studentDatabases = (await axios.get("/rest/studentdatabases/tas/own") as AxiosResponse<StudentDatabase[]>).data;
    }

    if (who.role < UserRole.Student) {
        tas = (await axios.get("/rest/tas/") as AxiosResponse<TA[]>).data;
    }

    ownDatabases = (await axios.get("/rest/studentdatabases/own/") as AxiosResponse<StudentDatabase[]>).data;


    await Promise.all([
        (async () => {
            await Promise.all([
                courses = (await getCoursesPromise()).sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename)),

                users = (who.role === UserRole.Teacher || who.role === UserRole.Admin) ? (await axios.get(`/rest/dbmusers/`) as AxiosResponse<User[]>).data : []

            ]);


            await displayCourses(courses, who, true)

        })(),

        initNavbar(changeEditCoursesState),
        newCourseContent.addEventListener("submit", (event) => {
            event.preventDefault();
            tryAddCourse();
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
            if (deleteCourseButton) {
                deleteCourseButton.addEventListener("click", () => {
                    tryDeleteCourse(Number(existingCourseIDField.value));
                })
            }
            if (dumpCourseButton) {
                dumpCourseButton.addEventListener("click", () => {
                    tryDumpCourse(Number(existingCourseIDField.value));

                })
            }

        })(),


        editCourseButton.addEventListener("click", () => {
            tryEditCourse();
        }),


        // populateNewCoursePane(),


        navbarEditCourses.classList.add("active"),
        (navbarEditCourses.firstElementChild)!.classList.add("disabled"),

    ]);

    Array.from(document.getElementsByClassName("spinner-border")).forEach((el: Element) => el.remove());
    autosize(document.querySelectorAll('textarea'));


};