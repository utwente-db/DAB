import {addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios from "axios";
import {passwordsEqual, validPassword} from "./register";

const djangoTemplate = document.getElementById("django-template") as HTMLTemplateElement;
const newPasswordButton = document.getElementById("new-password-button") as HTMLButtonElement;

const newPasswordField = document.getElementById("new-password-field") as HTMLInputElement;
const confirmPasswordField = document.getElementById("confirm-password-field") as HTMLInputElement;
const content = document.getElementById('content') as HTMLFormElement;


const pk = Number(djangoTemplate.classList[0]);
const token = djangoTemplate.classList[1];

function checkFields(): boolean {
    // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(newPasswordField);
    const c = passwordsEqual(newPasswordField, confirmPasswordField);
    return b && c
}

async function tryResetPassword(): Promise<void> {
    if (checkFields()) {
        newPasswordField.disabled = true;
        confirmPasswordField.disabled = true;
        newPasswordButton.disabled = true;

        const tempAlert: ChildNode | null = addTempAlert();
        try {
            await axios.post(`/reset_password/${pk}/${token}`, {'password': newPasswordField.value});
            if (tempAlert && document.body.contains(tempAlert)) {
                tempAlert.remove();
            }
            addTempAlert("Your password has been changed. You will be redirected to the login page.", AlertType.success, false, 0)
            await new Promise(resolve => setTimeout(resolve, 3000));
            window.location.href = "/";
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            newPasswordField.disabled = false;
            confirmPasswordField.disabled = false;
            newPasswordButton.disabled = false;
        }
    }
}

window.onload = () => {
    content.addEventListener("submit", (event) => {
        event.preventDefault();
        tryResetPassword();
    });
};