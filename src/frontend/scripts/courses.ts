import "../sass/main.sass"
import axios, {AxiosError, AxiosResponse} from 'axios';
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import {displayWhoami} from "./navbar";


const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;
const coursesDropdown: HTMLSelectElement = document.getElementById("courses-dropdown") as HTMLSelectElement;
const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string
}

interface Database {


    "fid": number,
    "course": number,
    "schema": number,
    "databasename": string,
    "username": string,
    "password": string

}

async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;

}

async function displayCourses(): Promise<void> {
    const courses: Course[] = await getCoursesPromise();
    const result: string[] = [];
    for (let i = 0; i < courses.length; i++) {
        const optionNode = document.createElement("option");
        optionNode.setAttribute("value", String(courses[i].courseid));
        optionNode.appendChild(document.createTextNode(courses[i].coursename));
        coursesDropdown.appendChild(optionNode)
        // result.push("<option value='" + courses[i].courseid + "'>" + courses[i].coursename + "</option>")
    }
    // const resultString: string = result.join("\n");
    // coursesDropdown.innerHTML += resultString;
}

async function getCredentials() {
    const courseID: number = Number(coursesDropdown.value);
    const resultDiv: HTMLDivElement = document.getElementById("result-div") as HTMLDivElement;

    if (courseID !== 0) {
        const data = {
            "course": courseID,
        };
        try {
            addTempAlert("Please wait...", AlertType.secondary);
            const response: AxiosResponse = await axios.post("/rest/studentdatabases/", data);
            const database: Database = await response.data;

            addAlert(`Database generated for course "${database.course}".<br>
                                                                   Username: "${database.username}"<br>
                                                                   Password: "${database.password}"`, AlertType.success)
        } catch (error) {
            addErrorAlert(error)
        }
    }
}

window.onload = async () => {
    await Promise.all([await displayCourses(),
        $('select').selectpicker(), // Style all selects
        credentialsButton.addEventListener("click", getCredentials),
        displayWhoami()]);
};

// TODO on course select: make group no longer gray