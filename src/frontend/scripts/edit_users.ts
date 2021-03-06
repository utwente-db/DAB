/**
 * edit_users.ts:
 * Contains code for the edit users page
 */

/**
 * Imports from other files
 */
import axios, {AxiosResponse, urlPrefix} from "./main";
import "popper.js";
import "bootstrap";
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import Swal from 'sweetalert2';
import {changePageState, initNavbar, navbarEditUsers} from "./navbar";
import {AlertType, Course, StudentDatabase, User, UserRole} from "./interfaces";
import {getCoursesPromise} from "./edit_courses";
import {setNeutral, tryRegister} from "./register";

/**
 * Constant variable declarations (HTML elements)
 */
const usersHtml = document.getElementById("users") as HTMLTableSectionElement,
    databasesNav = document.getElementById("databases-nav") as HTMLDivElement,
    courseDatabasesHtml = document.getElementById("courses-db") as HTMLDivElement,
    usernameHtml = document.getElementById("username") as HTMLInputElement,
    selectedRole = document.getElementById("selected-role") as HTMLSelectElement,
    verifiedHtml = document.getElementById("verified") as HTMLLabelElement,
    searchInput = document.getElementById("search") as HTMLInputElement,
    usersTbody = document.getElementById("users") as HTMLTableSectionElement,
    usersTabs = document.getElementById("users-tabs") as HTMLDivElement,
    editUserPane = document.getElementById("edit-user-pane") as HTMLDivElement,
    pleaseSelectAuser = document.getElementById("please-select-a-user") as HTMLDivElement,
    addUserLink = document.getElementById("add-user-link") as HTMLAnchorElement,
    addUserPane = document.getElementById("add-user-pane") as HTMLDivElement,
    addUserButton = document.getElementById("add-user-button") as HTMLButtonElement,
    addUserEmailField = document.getElementById("add-user-email-field") as HTMLInputElement,
    addUserPasswordField = document.getElementById('add-user-password-field') as HTMLInputElement,
    addUserPasswordConfirmField = document.getElementById('add-user-password-confirm-field') as HTMLInputElement,
    addUserForm = document.getElementById('add-user-form') as HTMLFormElement,
    addUserRole = document.getElementById("add-user-role") as HTMLSelectElement,
    databaseSearch = document.getElementById("database-search") as HTMLInputElement;


/**
 * Global variables that will be changed later on (arrays of courses, databases, users, and two buttons that we replace)
 */
let deleteButton = document.getElementById("delete-button") as HTMLButtonElement,
    editButton = document.getElementById("edit-button") as HTMLButtonElement,
    courses: Course[] = [],
    users: User[] = [],
    studentDatabases: StudentDatabase[] = [];

/**
 * Displays list of users inside the table
 */
async function displayUsers(): Promise<void> {
    users = (await getUsersPromise()).sort((a: User, b: User) => a.email.localeCompare(b.email));
    const result: string[] = [];

    for (let i = 0; i < users.length; i++) {
        const verified: boolean = users[i].verified;
        result.push(
            `<tr class="user-row not-disabled" id="user-row-${i}"></a>
 <th scope="row">${users[i].id}</th>
             <td>${UserRole[users[i].role]}</td>
             <td>${users[i].email}</td>
             <td>${verified}</td></tr>`.trim()
        );

    }

    const resultString: string = result.join("\n");
    usersHtml.innerHTML = resultString;

    for (let i = 0; i < users.length; i++) {
        document.getElementById(`user-row-${i}`)!.addEventListener("click", () => {
            Array.from(usersTabs.children).forEach((tab: Element) => {
                tab.classList.remove("active")
            });
            editUserPane.classList.add("active");
            // set new course pane active
            Array.from(document.getElementsByTagName('tr'))!.forEach((el: Element) => {
                el.classList.remove("active");
                el.removeAttribute("style")
            });
            document.getElementById(`user-row-${i}`)!.classList.add("active");
            document.getElementById(`user-row-${i}`)!.setAttribute("style", "pointer-events: none;");


            const deleteButtonClone = deleteButton!.cloneNode(true) as HTMLButtonElement;
            deleteButton.parentNode!.replaceChild(deleteButtonClone, deleteButton);
            deleteButton = deleteButtonClone;

            const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
            editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
            editButton = changeRoleButtonClone;
            editButton.classList.remove("btn-info");
            editButton.classList.add("btn-secondary");
            editButton.innerHTML = "Edit Role";
            selectedRole.setAttribute("disabled", "");
            editButton.addEventListener("click", () => {
                allowChangeRole(users[i])
            });
            deleteButton.addEventListener("click", () => {
                deleteUser(users[i])
            });

            addUserLink.removeAttribute("style");
            addUserLink.toggleAttribute("href", true);
            displayUserDetails(users[i]);
            displayCoursesAndDatabases(users[i]);
        })

    }
}

/**
 * sends GET to /rest/dbmusers
 * @returns promise of array of users
 */
export async function getUsersPromise(): Promise<User[]> {
    const response: AxiosResponse = await axios.get("/rest/dbmusers/");
    return response.data;
}

/**
 * Displays courses and databases for a user
 * @param user The user to display these for
 */
async function displayCoursesAndDatabases(user: User): Promise<void> {
    const databases: StudentDatabase[] = studentDatabases.filter(db => db.fid === user.id);

    const dbToHTMLmap: Map<StudentDatabase, string> = new Map<StudentDatabase, string>();
    if (databases.length === 0) {
        databasesNav.innerHTML = "This user does not have any databases";
        courseDatabasesHtml.innerHTML = "No database selected";
        return;
    }

    // const coursesAndDatabases = new Map<number, string>();


    for (let i = 0; i < databases.length; i++) {
        const course: Course = courses.find((course: Course) => course.courseid === databases[i].course)!;

        const html =
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].dbid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].databasename}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Username:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].username}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Password:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].password}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Group ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].groupid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Owner ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].fid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Course ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].course}" readonly="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Course name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${course.coursename}" readonly="">
                </div>
            </div>
            
            
                                    
                        
                        
            
            <div class="align-items-center align-items-stretch row">
            <div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button type="button" class="btn btn-secondary btn-block" onclick="window.location.replace('${urlPrefix}rest/dump/${databases[i].dbid}/')">
                Download dump
                
            </button>
            </div><div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex ">
            <button id="reset-button-${databases[i].dbid}" type="button" class="btn btn-info btn-block">
                Reset database
            </button>
            </div><div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button id="delete-button-${databases[i].dbid}" type="button" class="btn btn-danger btn-block">
                Delete database
            </button>
            </div>
            </div>`.trim();


        // This will mess up if someone has multiple db's for a single course
        dbToHTMLmap.set(databases[i], html);

    }

    const resultNav: string[] = [];
    const resultContent: string[] = [];
    let active = " active";
    for (const entry of Array.from(dbToHTMLmap.entries())) {
        const db: StudentDatabase = entry[0];

        const content: string = entry[1];

        resultNav.push(
            `<a class="studentdatabase-link nav-link${active}" data-toggle="pill" href="#db-${db.dbid}">${db.databasename} (group ${db.groupid})</a>`
        );
        resultContent.push(
            `<div class="tab-pane${active}" id="db-${db.dbid}">${content}</div>`
        );
        active = "";
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    databasesNav.innerHTML = resultNavString;
    courseDatabasesHtml.innerHTML = resultContentString;

    databases.forEach((db: StudentDatabase) => {
        const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${db.dbid}`) as HTMLButtonElement;
        resetButton.addEventListener("click", () => {
            resetDatabase(db.dbid, changeEditUserState);
        });
        const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${db.dbid}`) as HTMLButtonElement;
        deleteButton.addEventListener("click", () => {
            deleteDatabase(db.dbid, courseDatabasesHtml, studentDatabases, changeEditUserState);
        });
    });

}

/**
 * Attempts to delete a database, if the user agrees
 * @param dbID ID of DB to delete
 * @param dbDiv Div that contains database information
 * @param studentDatabases List of databases to remove the database from
 * @param disablePageFunction Callback function that disables elements on page
 * @returns new list of databases with the deleted one possibly filtered out
 */
export async function deleteDatabase(dbID: number, dbDiv: HTMLDivElement, studentDatabases: StudentDatabase[], disablePageFunction: Function): Promise<StudentDatabase[]> {
    const result = await Swal.fire({
        title: 'Are you sure you want to delete this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return studentDatabases;
    }
    const tempAlert = addTempAlert();
    changePageState(false, disablePageFunction);
    try {
        await axios.delete(`/rest/studentdatabases/${dbID}/`);
        studentDatabases = studentDatabases.filter(db => db.dbid !== dbID);
        addAlert("Database has been deleted", AlertType.primary, tempAlert);
        document.getElementsByClassName("studentdatabase-link nav-link active")[0].remove();
        dbDiv.innerHTML = "No database selected";
        // window.location.reload(true);
    } catch (error) {
        addErrorAlert(error, tempAlert);
    } finally {
        changePageState(true, disablePageFunction);
    }
    return studentDatabases;
}

/**
 * Resets database, if the user agrees
 * @param dbID ID of database to reset
 * @param disableCallback Function to disale all elements on page (called on API call)
 * @returns whether the operation succeeded
 */
export async function resetDatabase(dbID: number, disableCallback: Function): Promise<boolean> {
    const result = await Swal.fire({
        title: 'Are you sure you want to reset this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancel',
        confirmButtonText: 'Reset'
    });
    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;
    const tempAlert = addTempAlert();
    changePageState(false, disableCallback);
    try {
        await axios.post(`/rest/reset/${dbID}/`);
        addAlert("Database has been reset", AlertType.primary, tempAlert);
        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, disableCallback)
    }
    return success;
}

/**
 * Displays user details in the page
 * @param user
 */
async function displayUserDetails(user: User): Promise<void> {
    usernameHtml.value = user.email;
    selectedRole.value = String(user.role);
    verifiedHtml.innerHTML = (user.verified ? "<span>&#x2714</span>" : "<span>&#x2718</span>");
}

/**
 * Deletes a user (if the admin agrees)
 * @param user The user that was deleted
 * @returns whether the operation succeeded
 */
async function deleteUser(user: User): Promise<boolean> {
    const result = await Swal.fire({
        text: `Are you sure you want to delete ${user.email} from the system?`,
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;
    const tempAlert = addTempAlert();
    changePageState(false, changeEditUserState);
    try {
        await axios.delete(`/rest/dbmusers/${user.id}/`);
        addAlert("User successfully deleted!", AlertType.success, tempAlert);

        Array.from(usersTabs.children).forEach((tab: Element) => {
            tab.classList.remove("active")
        });
        pleaseSelectAuser.classList.add("active");
        document.getElementsByClassName("user-row active")[0]!.remove();
        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, changeEditUserState);
    }
    return success;
}

/**
 * Enables the "change role" select, and changes the edit role button styling / functionality
 * @param user User to change the role for
 */
function allowChangeRole(user: User): void {
    editButton.classList.remove("btn-secondary");
    editButton.classList.add("btn-info");
    editButton.innerHTML = "Save changes";
    selectedRole.removeAttribute("disabled");
    const editButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
    editButton.parentNode!.replaceChild(editButtonClone, editButton);
    editButton = editButtonClone;
    editButton.addEventListener("click", () => changeRole(user))
}

/**
 * Change role of user to the currently selected role (or, if current role is the same as selected role: don't do anything)
 * @param user User to change the role for
 * @returns Whether the operation succeeded
 */
async function changeRole(user: User): Promise<boolean> {
    const roleNumber: number = Number(selectedRole.value);
    if (user.role === roleNumber) {
        const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
        editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
        editButton = changeRoleButtonClone;
        editButton.classList.remove("btn-info");
        editButton.classList.add("btn-secondary");
        editButton.innerHTML = "Edit Role";
        selectedRole.setAttribute("disabled", "");
        editButton.addEventListener("click", () => {
            allowChangeRole(user)
        });
        return true;
    }
    const result = await Swal.fire({
        text: `Are you sure you want change the role of ${user.email} to ${UserRole[roleNumber]}?`,
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Confirm',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;
    const tempAlert = addTempAlert();
    changePageState(false, changeEditUserState);
    try {
        await axios.post(`/rest/set_role`, {
            user: user.id,
            role: roleNumber
        });
        user.role = roleNumber;
        (document.getElementsByClassName("user-row active")[0]!.children[1]! as HTMLAnchorElement).innerHTML = UserRole[roleNumber];
        const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
        editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
        editButton = changeRoleButtonClone;
        editButton.classList.remove("btn-info");
        editButton.classList.add("btn-secondary");
        editButton.innerHTML = "Edit Role";
        selectedRole.setAttribute("disabled", "");
        editButton.addEventListener("click", () => {
            allowChangeRole(user)
        });
        addAlert(`Role of ${user.email} was changed to ${UserRole[roleNumber]}!`, AlertType.primary, tempAlert);

        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, changeEditUserState)
    }
    return success;
}

/**
 * Disables / enables all elements on the page
 * @param enable Whether to enable, or disable elements
 */
function changeEditUserState(enable: boolean): void {
    const buttons: HTMLCollectionOf<HTMLButtonElement> = document.getElementsByTagName("button");
    const inputs: HTMLCollectionOf<HTMLInputElement> = document.getElementsByTagName("input");
    const tableRows: HTMLCollectionOf<HTMLTableRowElement> = document.getElementsByTagName("tr");
    const selects: HTMLCollectionOf<HTMLSelectElement> = document.getElementsByTagName("select");


    const navLinks = document.getElementsByClassName("nav-link") as HTMLCollectionOf<HTMLAnchorElement>;
    Array.from(buttons).forEach(button => button.disabled = !enable);
    Array.from(inputs).forEach(input => input.disabled = !enable);
    Array.from(selects).forEach(select => select.disabled = !enable);

    if (enable) {
        if (editButton.classList.contains("btn-secondary")) {
            selectedRole.disabled = true
        }
        Array.from(navLinks).forEach(navLink => navLink.classList.remove("disabled"));
        Array.from(tableRows).forEach(tableRow => {
            tableRow.classList.add("not-disabled");
            if (!tableRow.classList.contains("active")) {
                tableRow.removeAttribute("style");
            }
        })

        if (!addUserPane.classList.contains("active")) {
            addUserLink.removeAttribute("style");
            addUserLink.toggleAttribute("href", true);
        }

    } else {
        Array.from(navLinks).forEach(navLink => navLink.classList.add("disabled"));
        Array.from(tableRows).forEach(tableRow => {
            tableRow.classList.remove("not-disabled");
            tableRow.setAttribute("style", "pointer-events: none;");
        });

        addUserLink.setAttribute("style", "pointer-events: none;");
        addUserLink.toggleAttribute("href", false);
    }


}

/**
 * Populates add user pane (all values empty, select is set to student_.
 */
function populateAddUserPane(): void {
    [addUserPasswordConfirmField, addUserPasswordField, addUserEmailField, addUserRole].forEach(el => setNeutral(el));

    addUserEmailField.value = "";
    addUserPasswordField.value = "";
    addUserPasswordConfirmField.value = "";
    addUserRole.value = "2";
}

/**
 * When add user link is clicked, go to add user pane and make the add user link inactive
 * @param event Form event to prevent default action of
 */
function goToAddUserPane(event: Event): void {
    event.preventDefault();
    populateAddUserPane();
    addUserLink.setAttribute("style", "pointer-events: none;");
    addUserLink.toggleAttribute("href", false);
    Array.from(usersTabs.children).forEach((child) => {
        child.classList.remove("active");
    });
    Array.from(usersTbody.children).forEach((child) => {
        child.classList.remove("active");
    });
    addUserPane.classList.add("active");
}

/**
 * Switches the current view to the existing user pane after adding a user. Also adds that user to the users array,
 * adds a row at the correct spot in the table, and adds event listeners
 * @param user The user that has been added
 */
function switchPaneAfterCreatingUser(user: User): void {
    users.push(user);
    const i = users.indexOf(user);
    const verified: boolean = user.verified;
    const tableString =
        `<tr class="user-row not-disabled" id="user-row-${i}"></a>
 <th scope="row">${users[i].id}</th>
             <td>${UserRole[users[i].role]}</td>
             <td>${users[i].email}</td>
             <td>${verified}</td></tr>`.trim();

    const tableIndex = users.concat().sort((a: User, b: User) => a.email.localeCompare(b.email)).indexOf(user);
    document.getElementById(`user-row-${tableIndex - 1}`)!.insertAdjacentHTML("afterend", tableString);

    document.getElementById(`user-row-${i}`)!.addEventListener("click", () => {
        Array.from(usersTabs.children).forEach((tab: Element) => {
            tab.classList.remove("active")
        });
        editUserPane.classList.add("active");
        // set new course pane active
        Array.from(document.getElementsByTagName('tr'))!.forEach((el: Element) => {
            el.classList.remove("active");
            el.removeAttribute("style")
        });
        document.getElementById(`user-row-${i}`)!.classList.add("active");
        document.getElementById(`user-row-${i}`)!.setAttribute("style", "pointer-events: none;");


        const deleteButtonClone = deleteButton!.cloneNode(true) as HTMLButtonElement;
        deleteButton.parentNode!.replaceChild(deleteButtonClone, deleteButton);
        deleteButton = deleteButtonClone;

        const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
        editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
        editButton = changeRoleButtonClone;
        editButton.classList.remove("btn-info");
        editButton.classList.add("btn-secondary");
        editButton.innerHTML = "Edit Role";
        selectedRole.setAttribute("disabled", "");
        editButton.addEventListener("click", () => {
            allowChangeRole(users[i])
        });
        deleteButton.addEventListener("click", () => {
            deleteUser(users[i])
        });

        addUserLink.removeAttribute("style");
        addUserLink.toggleAttribute("href", true);
        displayUserDetails(users[i]);
        displayCoursesAndDatabases(users[i]);
    });

    document.getElementById(`user-row-${i}`)!.click();
}

/**
 * Get list of courses, init navbar, and add event listeners
 */
window.onload = async () => {
    studentDatabases = (await axios.get("/rest/studentdatabases/") as AxiosResponse<StudentDatabase[]>).data;
    await Promise.all([
        courses = await getCoursesPromise(),
        initNavbar(changeEditUserState),
        displayUsers(),
        navbarEditUsers.classList.add("active"),
        (navbarEditUsers.firstElementChild)!.classList.add("disabled"),

    ]);

    searchInput.addEventListener("keyup", () => {
        const value = searchInput.value.toLowerCase();
        Array.from(usersTbody.children).forEach((child: Element) => {
            const childRow = child as HTMLTableRowElement;
            childRow.hidden = !childRow.textContent!.toLowerCase().includes(value);
        });
    });

    databaseSearch.addEventListener("keyup", () => {
        const value = databaseSearch.value.toLowerCase();
        Array.from(databasesNav.children).forEach((child: Element) => {
            const childRow = child as HTMLAnchorElement;
            childRow.hidden = !childRow.textContent!.toLowerCase().includes(value);
        });
    });

    addUserLink.addEventListener("click", goToAddUserPane);
    addUserForm.addEventListener("submit", async (event) => {
        event.preventDefault();
        const user = await tryRegister(addUserEmailField, addUserPasswordField, addUserPasswordConfirmField, changePageState, changeEditUserState, true, Number(addUserRole.value))
        if (user) {
            // Operation succeeded
            switchPaneAfterCreatingUser(user);
        }

    })


};
