import "popper.js"
import "bootstrap"
import "bootstrap-select"

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

export interface User {
    id: number;
    role: number;
    email: string;
    password: string;
    verified: boolean;
    token: string;
}

export enum UserRole {
    Admin = 0,
    Teacher = 1,
    Student = 2
}

export interface TA {
    courseid: number,
    studentid: number,
    taid: number
}

/**
 * Interface that represents the body of the /rest/whoami/ response
 */
export interface Whoami {
    id: number;
    email: string;
    role: UserRole;
}

/**
 * Interface that represents the body of the /rest/who/ response (more lightweight version of whoami that doesn't require DB calls)
 */
export interface Who {
    id: number,
    role: UserRole
}

/**
 * The body of an error returned by the Django serializer is a JSON, with a key (a string) which maps to a list of strings
 */
export interface ErrorBody {
    [key: string]: string[]
}

/**
 * Interface which represents the body of the register (POST to /rest/dbmusers/) API call
 */
export interface Credentials {
    "email": string
    "password": string
}

/**
 * This specifies the color that the alert will have.
 * Primary is blue.
 * Secondary is grey.
 * Danger is red.
 * Success is green.
 */
export enum AlertType {
    primary = "alert-primary",
    secondary = "alert-secondary",
    danger = "alert-danger",
    success = "alert-success"
}