/**
 * edit_courses.ts:
 * Contains code for the edit courses page
 */

/**
 * Imports from other files
 */
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import axios, {AxiosResponse, urlPrefix} from "./main";
import Swal from "sweetalert2";
import {AlertType, Course, InputCourse, StudentDatabase, TA, User, UserRole, Who} from "./interfaces";
import {setInvalid, setNeutral, setValid} from "./register";
import {changePageState, getWhoPromise, initNavbar, navbarEditCourses} from "./navbar";
import {displayCourses} from "./student_view";
import {deleteDatabase, resetDatabase} from "./edit_users";
import autosize from "autosize"
import "popper.js"
import "bootstrap"

/**
 * Constant variable declarations (mostly html elements)
 */
const addCourseLink = document.getElementById("add-course-link") as HTMLAnchorElement,
    coursesNavHtml = document.getElementById("courses-nav") as HTMLDivElement,
    coursesContentHtml = document.getElementById("courses-content") as HTMLDivElement,
    existingCoursePane = document.getElementById("existing-course-pane") as HTMLDivElement,
    newCoursePane = document.getElementById("new-course-pane") as HTMLDivElement,
    studentDatabasesNavHtml = document.getElementById("studentdatabases-nav") as HTMLDivElement,
    courseDatabasesHtml = document.getElementById("courses-db") as HTMLDivElement,
    taNav = document.getElementById("TA-nav") as HTMLDivElement,
    taDiv = document.getElementById("TA-div") as HTMLDivElement,
    newCoursenameField = document.getElementById("new-course-name-field") as HTMLInputElement,
    newCourseInfoField = document.getElementById("new-course-info-field") as HTMLInputElement,
    newCourseFIDSelect = document.getElementById("new-course-fid-select") as HTMLSelectElement,
    newActiveField = document.getElementById("new-active-field") as HTMLInputElement,
    newSchemaRadioNone = document.getElementById("new-schema-radio-none") as HTMLInputElement,
    newSchemaRadioTextarea = document.getElementById("new-schema-radio-textarea") as HTMLInputElement,
    newSchemaRadioUpload = document.getElementById("new-schema-radio-upload") as HTMLInputElement,
    newSchemaRadioTransfer = document.getElementById("new-schema-radio-transfer") as HTMLInputElement,
    newSchemaTextarea = document.getElementById("new-schema-textarea") as HTMLTextAreaElement,
    newSchemaUpload = document.getElementById("new-schema-upload") as HTMLInputElement,
    newSchemaTransferCourseList = document.getElementById("new-schema-transfer-course-list") as HTMLSelectElement,
    newSchemaTransferDatabaseList = document.getElementById("new-schema-transfer-database-list") as HTMLSelectElement,
    newSchemaTransferRow = document.getElementById("new-schema-transfer-row") as HTMLSelectElement,
    newSchemaTextareaDiv = document.getElementById("new-schema-textarea-div") as HTMLDivElement,
    newSchemaUploadDiv = document.getElementById("new-schema-upload-div") as HTMLDivElement,
    newSchemaTransferDiv = document.getElementById("new-schema-transfer-div") as HTMLDivElement,
    newCourseContent = document.getElementById('new-course-content') as HTMLFormElement,
    addCourseButton = document.getElementById("add-course-button") as HTMLButtonElement,
    existingCourseIDField = document.getElementById("existing-course-id-field") as HTMLInputElement,
    existingCoursenameField = document.getElementById("existing-course-name-field") as HTMLInputElement,
    existingCourseInfoField = document.getElementById("existing-course-info-field") as HTMLInputElement,
    existingCourseFIDField = document.getElementById("existing-course-fid-field") as HTMLInputElement,
    existingActiveField = document.getElementById("existing-active-field") as HTMLInputElement,
    existingSchemaRadioNone = document.getElementById("existing-schema-radio-none") as HTMLInputElement,
    existingSchemaRadioTextarea = document.getElementById("existing-schema-radio-textarea") as HTMLInputElement,
    existingSchemaRadioUpload = document.getElementById("existing-schema-radio-upload") as HTMLInputElement,
    existingSchemaRadioTransfer = document.getElementById("existing-schema-radio-transfer") as HTMLInputElement,
    existingSchemaTextarea = document.getElementById("existing-schema-textarea") as HTMLTextAreaElement,
    existingSchemaUpload = document.getElementById("existing-schema-upload") as HTMLInputElement,
    existingSchemaTransferCourseList = document.getElementById("existing-schema-transfer-course-list") as HTMLSelectElement,
    existingSchemaTransferDatabaseList = document.getElementById("existing-schema-transfer-database-list") as HTMLSelectElement,
    existingSchemaTransferRow = document.getElementById("existing-schema-transfer-row") as HTMLSelectElement,
    existingSchemaTextareaDiv = document.getElementById("existing-schema-textarea-div") as HTMLDivElement,
    existingSchemaUploadDiv = document.getElementById("existing-schema-upload-div") as HTMLDivElement,
    existingSchemaTransferDiv = document.getElementById("existing-schema-transfer-div") as HTMLDivElement,
    existingCourseContent = document.getElementById('existing-course-content') as HTMLFormElement,
    editCourseButton = document.getElementById("edit-course-button") as HTMLButtonElement,
    deleteCourseButton = document.getElementById("delete-course-button") as HTMLButtonElement,
    dumpCourseButton = document.getElementById("dump-course-button") as HTMLButtonElement,
    databaseSearch = document.getElementById("database-search") as HTMLInputElement,
    taSearch = document.getElementById("ta-search") as HTMLInputElement;


/**
 * Global variables (mostly lists of objects which will be changed later on)
 */
let who: Who,
    courses: Course[] = [],
    currentCourse: Course,
    users: User[] = [],
    studentDatabases: StudentDatabase[] = [],
    tas: TA[] = [],
    ownDatabases: StudentDatabase[] = [];

/**
 * Checks if a course name is valid according to a regex, and gives user feedback in the form
 * @param field The field to check the input of and give feedback for
 * @returns boolean of whether or not the input is valid
 */
function validCoursename(field: HTMLInputElement): boolean {
    const coursenameRegex = /^[a-zA-Z0-9\.\-\+\/ ]+$/;
    if (coursenameRegex.test(field.value)) {
        setValid(field);
        return true
    } else {
        setInvalid(field, "This field can only contain alphanumerical and these: .-+/ characters, as well as spaces");
        return false
    }
}

/**
 * Checks whether course info field is non empty
 * @param field The field to check the input of and give feedback for
 * @returns boolean of whether or not the input is valid
 */
function validCourseinfo(field: HTMLInputElement): boolean {
    if (field.value.length > 0) {
        setValid(field);
        return true;
    } else {
        setInvalid(field, "This field cannot be empty");
        return false;
    }
}

/**
 * Empties and re-fills the dropdowns related to schema transfer, and adds event listeners
 * @param courseDropdown The dropdown to fill with courses
 * @param databaseDropdown The dropdown to fill with databases per course
 */
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

        const filteredDisplayDatabases = displayDatabases.filter(db => db.course === Number(courseDropdown.value));
        filteredDisplayDatabases.forEach(db => {
            const optionNode = document.createElement("option");
            optionNode.setAttribute("value", String(db.dbid));
            optionNode.appendChild(document.createTextNode(db.databasename));
            databaseDropdown.appendChild(optionNode);
        })
    })

}

function fillNewCourseFIDdropDown(): void {
    while (newCourseFIDSelect.lastElementChild !== newCourseFIDSelect.firstElementChild) {
        const child: Element = newCourseFIDSelect.lastElementChild!;
        newCourseFIDSelect.removeChild(child!);
    }

    users.forEach(user => {
        const optionNode = document.createElement("option");
        optionNode.setAttribute("value", String(user.id));
        optionNode.appendChild(document.createTextNode(user.email));
        newCourseFIDSelect.appendChild(optionNode);
    });
}

/**
 * (De)Populates the pane for adding a new course (resets all fields and calls [[fillStudentDatabasesDropdown]]
 */
function populateNewCoursePane(): void {
    Array.from(coursesNavHtml.children).forEach((child) => {
        child.classList.remove("active");
    });

    [newCourseFIDSelect, newCourseInfoField, newCoursenameField, newSchemaTextarea, newSchemaUpload, newSchemaTransferDatabaseList, newSchemaTransferCourseList].forEach((el) => {
        setNeutral(el);
    });

    newCourseFIDSelect.value = "0";
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
    fillNewCourseFIDdropDown();
    newSchemaTransferCourseList.value = String(0);
    newSchemaTransferDatabaseList.value = String(0);


}

/**
 * Changes the active pane to the "Add course" pane and populates it
 * @param event Form event that has to be prevented from running (so that we do not refresh the page)
 */
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

/**
 * Populates the pane for an existing course by filling the form inputs with the correct values
 * @param i The index of the course in the "courses" array
 */
async function populateExistingCoursePane(i: number): Promise<void> {
    studentDatabasesNavHtml.innerHTML = "";
    courseDatabasesHtml.innerHTML = "No database selected";
    if (who.role < UserRole.Student) {
        populateTAPane(i);
    }

    displayStudentDatabasesForCourse(i);
    [existingCourseInfoField, existingCoursenameField, existingSchemaTextarea, existingSchemaUpload, existingSchemaTransferDatabaseList, existingSchemaTransferCourseList].forEach((el) => {
        setNeutral(el);
    });

    if (existingCourseFIDField) {
        setNeutral(existingCourseFIDField)
        existingCourseFIDField.setAttribute("value", String(users.find(user => user.id === courses[i].fid)!.email));

    }

    currentCourse = courses[i];
    existingCourseIDField.setAttribute("value", String(courses[i].courseid));
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

/**
 * Changes the active pane to the pane that displays an existing course, and populates it
 * @param i The index of the course in the "courses" array
 */
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

/**
 * Checks the field's content for whether it is empty, or a number above 0 and gives the user feedvack
 * @param field The field to check the input of and give feedback for
 * @returns boolean of whether or not the input is valid
 */
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

/**
 * Checks if the textarea is not empty
 * @param field The field to check the input of and give feedback for
 * @returns boolean of whether or not the input is valid
 */
function nonEmptyTextarea(field: HTMLTextAreaElement): boolean {
    if (field.value === "") {
        setInvalid(field, "Please enter a valid string or select not to add a schema");
        return false;
    } else {
        setValid(field);
        return true;
    }
}

/**
 * Checks if the select field has a non-default value selected
 * @param select The field to check the input of and give feedback for
 * @returns boolean of whether or not a non-default value is selected
 */
export function validSelect(select: HTMLSelectElement): boolean {
    if (Number(select.value) > 0) {
        setValid(select);
        return true;
    } else {
        setInvalid(select, "Please select a value from this dropdown");
        return false;
    }
}

/**
 * Checks if a file has been selected for upload
 * @param uploadElement The field to check the input of and give feedback for
 * @returns boolean of whether or not a file is selected
 */
function validUpload(uploadElement: HTMLInputElement): boolean {
    if (uploadElement.files === null || uploadElement.files.length === 0) {
        setInvalid(uploadElement, "Please select a file");
        return false;
    } else {
        setValid(uploadElement);
        return true;
    }
}

/**
 * Checks if all the fields on the edit course page are correct
 * @param courseInfoField The course info field (should be non-empty)
 * @param coursenameField The course name field (should be non-empty)
 * @param schemaRadioNone The input radio for not changing/uploading a schema. If selected, we will not check any other fields
 * @param schemaRadioTextarea The input radio for changing/uploading a schema via textarea. If selected, we will check the textarea
 * @param schemaTextarea The text area field which will be checked if schemaRadioTextarea is selected
 * @param schemaRadioUpload The input radio for changing/uploading a schema via upload. If selected, we will check the upload field
 * @param schemaUpload The upload field which will be checked if schemaRadioUpload is selected
 * @param schemaRadioTransfer The input radio for changing/uploading a schema via schema transfer. If selected, we will check the schema transfer selects
 * @param schemaTransfer1 The first schema transfer select. Will be checked if schemaRadioTransfer is selected
 * @param schemaTransfer2 The second schema transfer select. Will be checked if schemaRadioTransfer is selected
 * @returns whether all fields to be checked are correct or not
 */
function checkFields(courseInfoField: HTMLInputElement, coursenameField: HTMLInputElement,
                     schemaRadioNone: HTMLInputElement, schemaRadioTextarea: HTMLInputElement, schemaTextarea: HTMLTextAreaElement,
                     schemaRadioUpload: HTMLInputElement, schemaUpload: HTMLInputElement, schemaRadioTransfer: HTMLInputElement,
                     schemaTransfer1: HTMLSelectElement, schemaTransfer2: HTMLSelectElement): boolean {
    setValid(courseInfoField);
    const a = validCoursename(coursenameField);
    const b = validCourseinfo(courseInfoField);
    let c = true;
    let d = true;
    if (schemaRadioTextarea.checked) {
        c = nonEmptyTextarea(schemaTextarea)
    } else if (schemaRadioUpload.checked) {
        c = validUpload(schemaUpload)
    } else if (schemaRadioTransfer.checked) {
        c = validSelect(schemaTransfer1);
        d = validSelect(schemaTransfer2);
    }
    return a && b && c && d
}

/**
 * Disables / enables all page elements depending on page input
 * @param enable Whether to enable elements or not
 */
function changeEditCoursesState(enable: boolean): void {
    const buttons: HTMLCollectionOf<HTMLButtonElement> = document.getElementsByTagName("button");
    const inputs: HTMLCollectionOf<HTMLInputElement> = document.getElementsByTagName("input");
    const selects: HTMLCollectionOf<HTMLSelectElement> = document.getElementsByTagName("select");
    const textAreas: HTMLCollectionOf<HTMLTextAreaElement> = document.getElementsByTagName("textarea");
    const labels: HTMLCollectionOf<HTMLLabelElement> = document.getElementsByTagName("label");

    // const tableRows: HTMLCollectionOf<HTMLTableRowElement> = document.getElementsByTagName("tr");
    const navLinks = document.getElementsByClassName("nav-link") as HTMLCollectionOf<HTMLAnchorElement>;


    Array.from(buttons).forEach(button => button.disabled = !enable);
    Array.from(inputs).forEach(input => input.disabled = !enable);
    Array.from(selects).forEach(select => select.disabled = !enable);
    Array.from(textAreas).forEach(textArea => textArea.disabled = !enable);


    if (enable) {
        Array.from(navLinks).forEach(navLink => navLink.classList.remove("disabled"));
        Array.from(labels).forEach(label => {
            label.classList.remove("disabled");
            label.removeAttribute("style");
        });


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
        Array.from(labels).forEach(label => {
            label.classList.add("disabled");
            label.setAttribute("style", "pointer-events: none;");
        });

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

/**
 * Gets a schema (as string) from form inputs
 * @param schemaRadioTextarea If this radio is selected, this function will get the schema from the textarea
 * @param schemaTextarea The textarea that we can get a schema from
 * @param schemaRadioUpload If this radio is selected, this function will get the schema from the upload input
 * @param schemaUpload The upload input we can get a schema from
 * @returns the schema as a string (unless none of the above radios are selected, then we return an empty string)
 */
async function getSchema(schemaRadioTextarea: HTMLInputElement, schemaTextarea: HTMLTextAreaElement, schemaRadioUpload: HTMLInputElement,
                         schemaUpload: HTMLInputElement): Promise<string> {
    if (schemaRadioTextarea.checked) {
        return (schemaTextarea.value as string)
    } else if (schemaRadioUpload.checked && schemaUpload.files) {
        const file: File = schemaUpload.files[0];
        return (await new Response(file)).text();

        // https://stackoverflow.com/questions/36665322/js-get-file-contents
    }
    return "";

}

/**
 * Tries to add a course if [[checkFields]] succeeds and gets the schema from [[getSchema]] or does a schema transfer
 */
async function tryAddCourse(): Promise<void> {
    if (checkFields(newCourseInfoField, newCoursenameField,
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

        if (newCourseFIDSelect.value !== "0") {
            inputCourse.fid = Number(newCourseFIDSelect.value)
        }

        try {

            const response = await axios.post(`/rest/courses/`, inputCourse) as AxiosResponse<Course>;
            const course: Course = response.data;
            addAlert("Successfully created course (without schema)", AlertType.success, tempAlert);
            const courseID = course.courseid;
            const schema: string = await getSchema(newSchemaRadioTextarea, newSchemaTextarea, newSchemaRadioUpload,
                newSchemaUpload);

            try {
                if (schema !== "") {
                    await axios.post(`/rest/courses/${courseID}/schema`, schema);
                    addAlert("successfully added schema", AlertType.success);
                } else if (newSchemaRadioTransfer.checked) {
                    const dbid = Number(newSchemaTransferDatabaseList.value);
                    await axios.post(`/rest/schematransfer/${courseID}/${dbid}`);
                    addAlert("Successfully added schema", AlertType.success);
                }
            } catch (error) {
                addErrorAlert((error))
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

/**
 * Attempts to remove a course
 * @param courseID the course ID
 * @returns whether or not the course was deleted
 */
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
        addAlert("The course has been successfully deleted", AlertType.primary, tempAlert);

        document.getElementsByClassName("course-link nav-link active")[0].remove();
        Array.from(coursesContentHtml.children).forEach((child) => {
            child.classList.remove("active");
        });
        document.getElementById("please-select-a-course")!.classList.add("active");
        studentDatabases = studentDatabases.filter(db => db.course !== courseID);
        tas = tas.filter(ta => ta.courseid !== courseID);
        success = true;

    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, changeEditCoursesState);
    }
    return success;
}

/**
 * Tries to edit a course if [[checkFields]] succeeds
 */
async function tryEditCourse(): Promise<void> {
    if (checkFields(existingCourseInfoField, existingCoursenameField,
        existingSchemaRadioNone, existingSchemaRadioTextarea, existingSchemaTextarea,
        existingSchemaRadioUpload, existingSchemaUpload, existingSchemaRadioTransfer,
        existingSchemaTransferCourseList, existingSchemaTransferCourseList)) {

        const inputCourse: Course = {
            courseid: Number(existingCourseIDField.value),
            coursename: existingCoursenameField.value,
            info: existingCourseInfoField.value,
            active: existingActiveField.checked,
            fid: Number(courses.find(course => course.courseid === Number(existingCourseIDField.value))!.fid)

        };

        const course = courses.find(course => inputCourse.courseid === course.courseid)!;
        if (course.coursename === inputCourse.coursename && course.info === inputCourse.info
            && course.active === inputCourse.active && existingSchemaRadioNone.checked) {
            addAlert("There are no changes to save!", AlertType.primary);
            return;
        }

        const result = await Swal.fire({
            title: 'Are you sure you want to save your changes?',
            text: 'This cannot be undone!',
            type: 'warning',
            showCancelButton: true,
            focusCancel: true,
            confirmButtonText: 'Save',
            cancelButtonText: 'Cancel'
        });

        // noinspection TypeScriptUnresolvedVariable
        if (result.dismiss === Swal.DismissReason.cancel) {
            return;
        }

        changePageState(false, changeEditCoursesState);
        const tempAlert: ChildNode | null = addTempAlert();


        try {
            const response = await axios.put(`/rest/courses/${existingCourseIDField.value}`, inputCourse) as AxiosResponse;
            addAlert("Successfully edited course (without schema)", AlertType.success, tempAlert);
            if (inputCourse.active) {
                document.getElementsByClassName("course-link active")[0]!.classList.remove("inactive-course");
            } else {
                document.getElementsByClassName("course-link active")[0]!.classList.add("inactive-course");
            }
            const schema: string = await getSchema(existingSchemaRadioTextarea, existingSchemaTextarea, existingSchemaRadioUpload,
                existingSchemaUpload);


            try {
                if (schema !== "") {

                    await axios.post(`/rest/courses/${existingCourseIDField.value}/schema`, schema);
                    addAlert("Successfully added schema", AlertType.success);


                } else if (existingSchemaRadioTransfer.checked) {
                    const dbid = Number(existingSchemaTransferDatabaseList.value);
                    await axios.post(`/rest/schematransfer/${existingCourseIDField.value}/${dbid}`);
                    addAlert("Successfully added schema", AlertType.success);
                }
            } catch (error) {
                addErrorAlert(error);
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

/**
 * Displays all the studentdatabases for the current course
 * @param i The index of the course in the "courses' array
 */
async function displayStudentDatabasesForCourse(i: number): Promise<void> {
    const databases: StudentDatabase[] = studentDatabases.filter(db => db.course === courses[i].courseid);

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
        let fidString = "";
        if (who.role < UserRole.Student) {
            fidString = `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Owner:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${users.find(user => user.id === databases[j].fid)!.email}" readonly="">
                </div>
            </div>`;
        } else {
            fidString = `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Owner:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].email}" readonly="">
                </div>
            </div>`;
        }
        const html: string =
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].dbid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].databasename}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Username:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].username}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Password:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].password}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Group ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[j].groupid}" readonly="">
                </div>
            </div>
            ${fidString}
          
            
            
            <div class="align-items-center align-items-stretch row">
            <div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button type="button" class="btn btn-secondary btn-block" onclick="window.location.replace('${urlPrefix}rest/dump/${databases[j].dbid}/')">
                Download dump
                
            </button>
            </div><div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex ">
            <button id="reset-button-${databases[j].dbid}" type="button" class="btn btn-info btn-block">
                Reset database
            </button>
            </div><div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button id="delete-button-${databases[j].dbid}" type="button" class="btn btn-danger btn-block">
                Delete database
            </button>
            </div>
            </div>`.trim()

        ;

        // This will mess up if someone has multiple db's for a single course
        dbToHTMLmap.set(databases[j], html);
    }

    for (const entry of Array.from(dbToHTMLmap.entries())) {
        const db: StudentDatabase = entry[0];
        const content: string = entry[1];

        let templateString = ""
        if (who.role < UserRole.Student) {
            templateString = `<a class="studentdatabase-link nav-link" data-toggle="pill" href="#">${db.databasename}<br>${users.find(user => user.id === db.fid)!.email} (group ${db.groupid})</a>`;
        } else {
            templateString = `<a class="studentdatabase-link nav-link" data-toggle="pill" href="#">${db.databasename}<br>${db.email} (group ${db.groupid})</a>`;

        }
        const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

        fragment.firstElementChild!.addEventListener("click", (event) => {
            courseDatabasesHtml.innerHTML = content;

            const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${db.dbid}`) as HTMLButtonElement;
            resetButton.addEventListener("click", () => {
                resetDatabase(db.dbid, changeEditCoursesState);
            });
            const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${db.dbid}`) as HTMLButtonElement;
            deleteButton.addEventListener("click", async () => {
                studentDatabases = await deleteDatabase(db.dbid, courseDatabasesHtml, studentDatabases, changeEditCoursesState);
            });
        });


        studentDatabasesNavHtml.appendChild(fragment);


    }

}

/**
 * Makes a user into a TA for a course
 * @param user User to be made TA
 * @param i Index of course in "courses" array
 * @returns whether the operation succeeded
 */
async function makeUserTA(user: User, i: number): Promise<boolean> {
    const taObject: { studentid: number; courseid: number } = {
        "courseid": courses[i].courseid,
        "studentid": user.id
    };
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
                removeTA(ta);
            });
        });

        activeLink.insertAdjacentElement("afterend", newFragment.firstElementChild!);
        activeLink.remove();

        taDiv.innerHTML = generateTaDivHTML(user, true);

        const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
        userTAButton.addEventListener("click", () => {
            removeTA(ta);
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

/**
 * Removes a user as TA
 * @param ta TA object to be removed
 * @returns whether the operation succeeded
 */
async function removeTA(ta: TA): Promise<boolean> {
    const tempAlert = addTempAlert();
    let success = false;
    const user: User = users.find(user => user.id === ta.studentid)!;
    changePageState(false, changeEditCoursesState);
    try {
        const response = await axios.delete(`/rest/tas/${ta.taid}/`) as AxiosResponse;
        tas = tas.filter(ta => ta.taid !== ta.taid);
        addAlert(`${user.email} is no longer a TA`, AlertType.success, tempAlert);

        const templateString = `<a class="ta-link nav-link not-green-nav active" data-toggle="pill" href="#">${user.email}</a>`;
        const newFragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

        const activeLink: HTMLAnchorElement = document.getElementsByClassName("ta-link nav-link active")[0] as HTMLAnchorElement;

        activeLink.classList.remove("active");


        newFragment.firstElementChild!.addEventListener("click", (event) => {
            const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
            userTAButton.addEventListener("click", () => {
                makeUserTA(user, courses.findIndex(course => course.courseid === ta.courseid));
            });
        });

        activeLink.insertAdjacentElement("afterend", newFragment.firstElementChild!);
        activeLink.remove();

        taDiv.innerHTML = generateTaDivHTML(user, false);

        const userTAButton: HTMLButtonElement = document.getElementById(`user-ta-button`) as HTMLButtonElement;
        userTAButton.addEventListener("click", () => {
            makeUserTA(user, courses.findIndex(course => course.courseid === ta.courseid));
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

/**
 * Generates the inner HTML for the TA div
 * @param user The selected user
 * @param userIsTaForCourse If the user is a TA or not
 * @returns the HTML as string
 */
function generateTaDivHTML(user: User, userIsTaForCourse: boolean): string {
    const userIsTaString = userIsTaForCourse ? `<span class="text-success h5">${user.email} is a TA for this course</span>` :
        `<span class="text-danger h5">${user.email} is not a ${user.role < UserRole.Student ? "co-teacher" : "TA"} for this course</span>`;
    const userTaButton = `<button class="btn btn-info" id="user-ta-button">Change user ${user.role < UserRole.Student ? "co-teacher" : "TA"} status</button>`;
    const taDivHTML = `${userIsTaString}<br>
                           ${userTaButton}`.trim();
    return taDivHTML;
}

/**
 * Populates the TA pane
 * @param i The index of the relevant course in the "courses' array
 */
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
                    removeTA(tas.find(ta => ta.taid === taID)!);
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

/**
 * Gets dump of course via href
 * @param id Course ID
 */
function tryDumpCourse(id: number): void {
    window.location.href = urlPrefix + `rest/course_dump/${id}`;
}

/**
 * Gets list of all courses
 * @returns the list of all courses
 */
export async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;
}

/**
 * Sets multiple global variables such as:
 * "who" see [[Who]]
 * studentDatabases (see [[StudentDatabase]] ) (all of them if admin, your courses' if you are teacher, your TA courses if you are student)
 * ownDatabases ( see [[StudentDatabase]] ), the databases you own for courses (as a "student")
 * users (see [[User]] ), the list of users (only if you are Admin/Teacher)
 * Then, populates the page
 * Afterwards, adds lots of event listeners
 * Finally, removes all spinners and makes textareas expand
 */
window.onload = async () => {
    who = await getWhoPromise();
    if (who.role === UserRole.Admin) {
        studentDatabases = (await axios.get("/rest/studentdatabases/") as AxiosResponse<StudentDatabase[]>).data;
    } else if (who.role === UserRole.Teacher) {
        studentDatabases = (await axios.get("/rest/studentdatabases/teacher/own") as AxiosResponse<StudentDatabase[]>).data;
    } else {
        studentDatabases = (await axios.get("/rest/studentdatabases/tas/own") as AxiosResponse<StudentDatabase[]>).data;
    }

    if (who.role === UserRole.Admin) {
        tas = (await axios.get("/rest/tas/") as AxiosResponse<TA[]>).data;
    } else if (who.role === UserRole.Teacher) {
        tas = (await axios.get("/rest/tas/teacher/own/") as AxiosResponse<TA[]>).data;
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
            if (taSearch) {
                taSearch.addEventListener("keyup", () => {
                    const value = taSearch.value.toLowerCase();
                    Array.from(taNav.children).forEach((child: Element) => {
                        const childRow = child as HTMLAnchorElement;
                        childRow.hidden = (!(childRow.textContent!.toLowerCase().includes(value)) && !(value === "!ta" && childRow.classList.contains("green-nav")));
                    });
                })
            }

        })(),


        editCourseButton.addEventListener("click", () => {
            tryEditCourse();
        }),

        databaseSearch.addEventListener("keyup", () => {
            const value = databaseSearch.value.toLowerCase();
            Array.from(studentDatabasesNavHtml.children).forEach((child: Element) => {
                const childRow = child as HTMLAnchorElement;
                childRow.hidden = !childRow.textContent!.toLowerCase().includes(value);
            });
        }),


        // populateNewCoursePane(),


        navbarEditCourses.classList.add("active"),
        (navbarEditCourses.firstElementChild)!.classList.add("disabled"),

    ])
    ;

    Array.from(document.getElementsByClassName("spinner-border")).forEach((el: Element) => el.remove());
    autosize(document.querySelectorAll('textarea'));


};