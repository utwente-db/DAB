import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {passwordsEqual, validPassword} from "./register";

const djangoTemplate = document.getElementById("django-template") as HTMLTemplateElement;
const newPasswordButton = document.getElementById("new-password-button") as HTMLButtonElement;

const oldPasswordField = document.getElementById("old-password-field") as HTMLInputElement;
const newPasswordField = document.getElementById("new-password-field") as HTMLInputElement;
const confirmPasswordField = document.getElementById("confirm-password-field") as HTMLInputElement;
const content = document.getElementById('content') as HTMLFormElement;


const pk = Number(djangoTemplate.classList[0]);
const token = djangoTemplate.classList[1];

function checkFields(): boolean {
    const a = validPassword(oldPasswordField); // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(newPasswordField);
    const c = passwordsEqual(newPasswordField, confirmPasswordField);
    return a && b && c
}

async function tryResetPassword(): Promise<void> {
    if (checkFields()) {
        const tempAlert: ChildNode | null = addTempAlert();
        try {
            await axios.post(`/reset_password/${pk}/${token}`, {'password': newPasswordField.value});
            window.location.href = "/password_has_been_reset";
        } catch (error) {
            addErrorAlert(error, tempAlert)
        }
    }
}

window.onload = () => {
    content.addEventListener("submit", (event) => {
            event.preventDefault();
            tryResetPassword();
        });
};