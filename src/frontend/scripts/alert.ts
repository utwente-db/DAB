import {AxiosError, AxiosResponse} from "./main";

const delay = (ms: number) => new Promise(res => setTimeout(res, ms));

/**
 * This function generates the HTML for an alert
 * @param errorMessage The message's content
 * @param alertType The alert color. See [[AlertType]].
 * @param dismissable Whether the alert can be dismissed or not (adds an X that is clickable).
 */
export function generateAlertHTML(errorMessage: string, alertType: AlertType, dismissable = true): string {
    const dismissableString = dismissable ? "alert-dismissible" : "temp-alert";
    const buttonString = dismissable ? ` <button type="button" class="close error-dismiss-button" data-dismiss="alert"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>` : ``;
    return `<div class="alert ${alertType} ${dismissableString} fade show col-12"  role="alert">
            <div class="error-text">${errorMessage}</div>
            ${buttonString}
            </div>`
}

/**
 * Removes any temporary alerts passed to it, and generates the
 * @param errorMessage The message's content
 * @param alertType The alert color. See [[AlertType]].
 * @param tempAlert The temporary alert node that must be removed
 */
export function addAlert(errorMessage: string, alertType: AlertType, tempAlert: ChildNode | null = null): ChildNode | null {
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
    }
    const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType);
    const alert: ChildNode | null = alertDiv.lastChild;
    removeAlertOnTimeout(alert, 10000, false);
    return alert;
}

/**
 * Removes an alert after "ms" milliseconds have passed
 * @param alert The alert to be removed
 * @param ms Amount of milliseconds to wait
 * @param timeOutError Whether to give an error if the alert was removed (which means there was a timeout)
 */
async function removeAlertOnTimeout(alert: ChildNode | null, ms: number, timeOutError: boolean): Promise<void> {
    await delay(ms);
    if (alert && document.body.contains(alert)) {
        alert.remove();
        if (timeOutError) {
            addAlert("Request timed out", AlertType.danger)
        }
    }
}

/**
 * Adds a temporary alert. By default, adds a "Please wait..."  which is removed after 10 seconds.
 * @param errorMessage The error message
 * @param alertType The alert color, see [[AlertType]]
 * @param timeOutError Whether to give an error after "ms" milliseconds have passed
 * @param ms Amount of milliseconds to wait
 */
export function addTempAlert(errorMessage = "Please wait...", alertType = AlertType.secondary, timeOutError = true, ms = 10000): ChildNode | null {
    const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType, false);
    const tempAlert: ChildNode | null = alertDiv.lastChild;
    if (ms > 0) {
        removeAlertOnTimeout(tempAlert, ms, timeOutError);
    }
    return tempAlert

}

/**
 * The body of an error returned by the Django serializer is a JSON, with a key (a string) which maps to a list of strings
 */
interface ErrorBody {
    [key: string]: string[]
}

/**
 * Accepts a javascript error and tries to insert an appropriate alert into the alert-div.
 * If the error is known, it will give the user a nice alert string which is probably more descriptive than the string in the error object.
 * If the error body is a string, it puts the string in the alert.
 * If it is a django error (see [[ErrorBody]] , it will output that error).
 * Otherwise it outputs the HTTP status code error, or the javascript error that was encountered.
 * @param error The error object
 * @param tempAlert The temporary alert to remove on adding the new alert.
 */
export function addErrorAlert(error: Error, tempAlert: ChildNode | null = null): void {
    console.error(error);
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
    }
    const responseError: AxiosError = error as AxiosError;
    const response: AxiosResponse | undefined = responseError.response;

    if (response) {
        // This is an axios error
        if (response.data === undefined || response.data === null || response.data === "") {
            // This is an axios error with empty body, just print standard error message with status code
            addAlert(error.message, AlertType.danger)
        } else if (typeof response.data === "string") {
            const errorString = response.data as string;
            // This is an axios error with string body
            if (response.status === 403 && errorString === "token expired") {
                addAlert("Your reset token has expired. Please request a new one.", AlertType.danger)
            } else {
                // Print the string
                addAlert(errorString, AlertType.danger)
            }
        } else {
            // This is an axios error with django error body
            const errorObject: ErrorBody = (response as AxiosResponse<ErrorBody>).data;

            const errorKeys: string[] = Object.keys(errorObject);
            const errorMessages: string[][] = Object.values(errorObject);

            // check for specific errors

            if (errorKeys[0] === "non_field_errors" && errorMessages[0][0] === "The fields course, fid must make a unique set.") {
                // If this is a specific alert for requesting a database as user and getting a 409 with this message back:
                addAlert("You already have database credentials for this course", AlertType.danger)
            } else if (errorKeys[0] === "email" && errorMessages[0][0] === "dbmusers with this email already exists.") {
                addAlert("Another user is already registered using this e-mail", AlertType.danger)
            }else if (errorKeys[0] === "non_field_errors" && errorMessages[0][0] === "The fields fid, coursename must make a unique set.") {
                addAlert("The course name is not unique", AlertType.danger)

            } else { // No longer checking for specific errors
                // This is a response error (4XX or 5XX etc)
                let alertMessage = "";
                for (let i = 0; i < errorKeys.length; i++) {
                    alertMessage += (errorKeys[i] + ":<br>" + errorMessages[i].join("<br>") + "<br<br>")
                }
                addAlert(error + "<br><br>" + alertMessage, AlertType.danger)
            }
        }
    } else {
        // This is a generic javascript error
        addAlert(error.message, AlertType.danger)
    }
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

