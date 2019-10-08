import {AxiosError, AxiosResponse} from "axios";

const delay = (ms: number) => new Promise(res => setTimeout(res, ms));

export function generateAlertHTML(errorMessage: string, alertType: AlertType, dismissable = true): string {
    const dismissableString = dismissable ? "alert-dismissable" : "temp-alert";
    const buttonString = dismissable ? ` <button type="button" class="close error-dismiss-button" data-dismiss="alert"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>` : ``
    return `<div class="alert ${alertType} ${dismissableString} fade show"  role="alert">
            <div class="error-text">${errorMessage}</div>
            ${buttonString}
            </div>`
};

export function addAlert(errorMessage: string, alertType: AlertType): void {
    removeTempAlerts();
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

export async function addTempAlert(errorMessage: string, alertType: AlertType): Promise<void> {
    const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType, false);
    await delay(5000);
    removeTempAlerts()
    // TODO maybe don't remove all temp alerts

}

export function addErrorAlert(error: Error) {
    const responseError: AxiosError = error as AxiosError<{ [key: string]: string[] }>;
    const response: AxiosResponse<{ [key: string]: string[] }> | undefined = responseError.response;
    if (response) {
        const errorKeys: string[] = Object.keys(response.data);
        const errorMessages: string[][] = Object.values(response.data);
        if (errorKeys[0] === "non_field_errors" && errorMessages[0][0] === "The fields course, fid must make a unique set.") {
            addAlert("You already have database credentials for this course", AlertType.danger)
        } else {
            let alertMessage = "";
            for (let i = 0; i < errorKeys.length; i++) {
                alertMessage += (errorKeys[i] + ":<br>" + errorMessages[i].join("<br>") + "<br<br>")
            }
            addAlert(error + "<br><br>" + alertMessage, AlertType.danger)
        }
    } else {
        addAlert(error.message, AlertType.danger)
    }
}

export enum AlertType {
    primary = "alert-primary",
    secondary = "alert-secondary",
    danger = "alert-danger",
    success = "alert-success"
}

