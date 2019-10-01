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
        result.push("<option>" + courses[i].coursename + "</option>")
    }
    const resultString: string = result.join("\n");
    coursesDropdown.innerHTML += resultString;
}

function getCredentials() {
    const course: string = coursesDropdown.value;
    if (course !== "select an option") {
        axios.post("/api/user/email/check", "eet")
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
    // credentialsButton.addEventListener("click", getCredentials);
};

// TODO: make group gray
// TODO on course select: make group no longer gray