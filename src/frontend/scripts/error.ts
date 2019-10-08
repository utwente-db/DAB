const delay = (ms: number) => new Promise(res => setTimeout(res, ms));

export function generateAlertHTML(errorMessage: string, alertType: Alert, dismissable = true): string {
    const dismissableString = dismissable ? "alert-dismissable" : "temp-alert";
    const buttonString = dismissable ? `<button type="button" id="error-dismiss-button" class="close" data-dismiss="alert" aria-label="Close"/>` : ``
    return `<div class="alert ${alertType} ${dismissableString} fade show"  role="alert">
            <div id="error-text">${errorMessage}</div>
            ${buttonString}
            </div>`
};

export function addAlert(errorMessage: string, alertType: Alert): void {
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

export async function addTempAlert(errorMessage: string, alertType: Alert): Promise<void> {
    const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;
    alertDiv.innerHTML += generateAlertHTML(errorMessage, alertType, false);
    await delay(5000);
    removeTempAlerts()
    // TODO maybe don't remove all temp alerts

}

export enum Alert {
    primary = "alert-primary",
    secondary = "alert-secondary",
    danger = "alert-danger",
    success = "alert-success"
}

