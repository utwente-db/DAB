import axios, {AxiosResponse} from 'axios';
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
// import {displayWhoami} from "./navbar";
//
//
// const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;
// const coursesDropdown: HTMLSelectElement = document.getElementById("courses-dropdown") as HTMLSelectElement;
// const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
// const groupInput: HTMLInputElement = document.getElementById("group-input") as HTMLInputElement;

export interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string,
    active: boolean,
    databases?: number,
}

export interface InputCourse {
    coursename: string,
    info: string,
    fid?: number
    schema?: string,
    active?: boolean
}

export interface StudentDatabase {
    "dbid": number,
    "groupid": number,
    "fid": number,
    "course": number,
    "schema": number,
    "databasename": string,
    "username": string,
    "password": string
}

export async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;

}

// async function displayCourses(): Promise<void> {
//     const courses: Course[] = await getCoursesPromise();
//     const result: string[] = [];
//     for (let i = 0; i < courses.length; i++) {
//         const optionNode = document.createElement("option");
//         optionNode.setAttribute("value", String(courses[i].courseid));
//         optionNode.appendChild(document.createTextNode(courses[i].coursename));
//         coursesDropdown.appendChild(optionNode)
//         // result.push("<option value='" + courses[i].courseid + "'>" + courses[i].coursename + "</option>")
//     }
//     // const resultString: string = result.join("\n");
//     // coursesDropdown.innerHTML += resultString;
// }

export async function tryGetCredentials(courseID: number, groupNumber: number, alert = true): Promise<boolean> {

    if (courseID !== 0) {
        if (groupNumber > 0) {
            const data = {"course": courseID, "groupid": groupNumber};
            const tempAlert: ChildNode | null = addTempAlert();
            try {
                const response: AxiosResponse<StudentDatabase> = await axios.post("/rest/studentdatabases/", data) as AxiosResponse<StudentDatabase>;
                const database: StudentDatabase = await response.data;
                if (alert) {
                    addAlert(`Database generated for course "${database.course}".<br>
                                                                   Username: "${database.username}"<br>
                                                                   Password: "${database.password}"`, AlertType.success, tempAlert);
                } else {
                    if (tempAlert) {
                        tempAlert.remove();
                    }
                }

                return true;
            } catch (error) {
                addErrorAlert(error, tempAlert)
            }
        } else {
            addAlert("Please enter a valid group number", AlertType.danger)
        }

    } else {
        addAlert("Please select a course", AlertType.danger)
    }
    return false;
}

// deprecated page onload
// window.onload = async () => {
//     await Promise.all([displayWhoami(),
//         await displayCourses(),
//         $('select').selectpicker(), // Style all selects
//         credentialsButton.addEventListener("click", () => {
//             tryGetCredentials(Number(coursesDropdown.value), Number(groupInput.value))
//         }),
//     ]);
// };

