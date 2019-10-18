import {AxiosError, AxiosResponse} from "axios";

const delay = (ms: number) => new Promise(res => setTimeout(res, ms));

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

export function addAlert(errorMessage: string, alertType: AlertType, tempAlert: ChildNode | null = null): void {
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
    }
    const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType);
}

function removeTempAlerts(): void {
    const tempAlerts: HTMLCollectionOf<Element> = document.getElementsByClassName("temp-alert");
    for (let i = 0; i < tempAlerts.length; i++) {
        const alert: Element = tempAlerts[i];
        alert.remove();
    }
}

async function removeAlertOnTimeout(tempAlert: ChildNode | null, ms: number, timeOutError: boolean) {
    await delay(ms);
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
        if (timeOutError) {
            addAlert("Request timed out", AlertType.danger)
        }
    }
}

export function addTempAlert(errorMessage = "Please wait...", alertType = AlertType.secondary, timeOutError = true, ms = 10000): ChildNode | null {
    const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType, false);
    const tempAlert: ChildNode | null = alertDiv.lastChild;
    // noinspection JSIgnoredPromiseFromCall
    if (ms > 0) {
        removeAlertOnTimeout(tempAlert, ms, timeOutError);
    }
    return tempAlert

}

interface ErrorBody {
    [key: string]: string[]
}

export function addErrorAlert(error: Error, tempAlert: ChildNode | null = null) {
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


            } else { // No longer checking for specific errors
                // This is a response error (4XX or 5XX etc)
                // TODO this fails if response is string
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

export enum AlertType {
    primary = "alert-primary",
    secondary = "alert-secondary",
    danger = "alert-danger",
    success = "alert-success"
}

