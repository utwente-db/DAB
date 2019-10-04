export function generateAlertHTML(errorMessage: string, alertType: Alert): string {
    return `<div class="alert ${alertType} alert-dismissible fade show"  role="alert">
            <div id="error-text">${errorMessage}</div>
            <button type="button" id="error-dismiss-button" class="close" data-dismiss="alert"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            </div>`
};

export enum Alert {
    primary = "alert-primary",
    secondary = "alert-secondary",
    danger = "alert-danger",
    success = "alert-success"
}

