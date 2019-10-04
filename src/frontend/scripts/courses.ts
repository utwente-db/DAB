import "../sass/desktop.sass"
import "./error"
import axios, {AxiosResponse} from 'axios';
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import {Alert, generateAlertHTML} from "./error";



const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;
const coursesDropdown: HTMLSelectElement = document.getElementById("courses-dropdown") as HTMLSelectElement; // TODO actually make dropdown and fill
const errorDismissButton: HTMLButtonElement = document.getElementById("error-dismiss-button") as HTMLButtonElement;
const errorText: HTMLDivElement = document.getElementById("error-text") as HTMLDivElement;
const errorDiv: HTMLDivElement = document.getElementById("error-div") as HTMLDivElement;

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

async function getCoursesPromise(): Promise<Course[]> { // TODO Check type here
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;
    // let next = JSON.parse(data)
    // TODO actually convert API data to human readable format
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
            const response: AxiosResponse = await axios.post("/rest/studentdatabases/", data);
            console.log(response);
            // TODO if !reponse error..?
            const database: Database = await response.data;
            console.log(database);

            resultDiv.innerHTML += generateAlertHTML(`Database generated for course "${database.course}".<br>
                                                                   Username: "${database.username}"<br>
                                                                   Password: "${database.password}"`, Alert.success)
        } catch (error) {
            errorDiv.innerHTML += generateAlertHTML(error, Alert.danger)
        }
    }
    //         .then(response => {
    //             let data = response.data;
    //             if (data.emails.length == 0 && checkAllFieldsFilledIn()) {
    //                 bookRoom();
    //             } else if (!checkAllFieldsFilledIn()) {
    //                 showError("Please fill in all fields");
    //             } else {
    //                 showError("one of the emails is invalid");
    //             }
    //         });
    // } else if (checkAllFieldsFilledIn()) {
    //     bookRoom();
    // } else {0:10] "GET /static/scripts/courses.js HTTP/1.1" 200 685245
    // [04/Oct/2019 12:20:10] "GET /static/css/main.css HTTP/1.1" 200 200937
    // [04/Oct/2019 12:20:11] "GET /favicon.ico HTTP/1.1" 200 741
    // [04/Oct/2019 12:20:11] "GET /rest/courses/ HTTP/1.1" 200 3066
    // [04/Oct/2019
    //     showError("Please fill in all fields");
    // }

}

window.onload = async () => {
    await displayCourses();
    $('select').selectpicker(); // Style all selects
    credentialsButton.addEventListener("click", getCredentials);
    // errorDismissButton.addEventListener("click", () => {
    // });// TODO hide
};

// TODO: make group gray
// TODO on course select: make group no longer gray