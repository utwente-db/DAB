import axios, {AxiosResponse} from 'axios';
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import "../sass/desktop.sass"

const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;
const coursesDropdown: HTMLSelectElement = document.getElementById("courses-dropdown") as HTMLSelectElement; // TODO actually make dropdown and fill

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
        result.push("<option value='" + courses[i].courseid + "'>" + courses[i].coursename + "</option>")
    }
    const resultString: string = result.join("\n");
    coursesDropdown.innerHTML += resultString;
}

async function getCredentials() {
    const courseID: number = Number(coursesDropdown.value);
    if (courseID !== 0) {
        const data = {
            "course": courseID,
        };
        try {
            const response: AxiosResponse = await axios.post("/rest/studentdatabases/", data);
            console.log(response)
            // TODO if !reponse error..?
            const database: Database = await response.data;
            console.log(database)
        } catch (error) {
            console.error(error)
        }
        console.log("got to the end")
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
    // } else {
    //     showError("Please fill in all fields");
    // }

}

window.onload = async () => {
    await displayCourses();
    $('select').selectpicker(); // Style all selects
    credentialsButton.addEventListener("click", getCredentials);
};

// TODO: make group gray
// TODO on course select: make group no longer gray