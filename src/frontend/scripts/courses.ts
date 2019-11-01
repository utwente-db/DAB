import axios, {AxiosResponse} from "./main";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";

/**
 * Object representation of the JSON of a course
 * Databases field is often left empty
 */
export interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string,
    active: boolean,
    databases?: number,
}

/**
 * Object representation of a course when it is created (does not have an ID yet)
 */
export interface InputCourse {
    coursename: string,
    info: string,
    fid?: number
    schema?: string,
    active?: boolean
}

/**
 * Object representation of a database
 */
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

/**
 * Returns list of all courses
 */
export async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;

}

/**
 * Try to request course credentials for this course and group
 * @param courseID The course ID
 * @param groupNumber The group number
 * @param alert Whether to add an alert or not
 */
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