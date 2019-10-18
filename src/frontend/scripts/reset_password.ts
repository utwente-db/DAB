import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";
import {passwordsEqual, validPassword} from "./register";

const djangoTemplate = document.getElementById("django-template") as HTMLTemplateElement;
const newPasswordButton = document.getElementById("new-password-button") as HTMLButtonElement;

const oldPasswordField = document.getElementById("old-password-field") as HTMLInputElement;
const newPasswordField = document.getElementById("new-password-field") as HTMLInputElement;
const confirmPasswordField = document.getElementById("confirm-password-field") as HTMLInputElement;

const pk = Number(djangoTemplate.classList[0]);
const token = djangoTemplate.classList[1];

function checkFields(): boolean {
    const a = validPassword(oldPasswordField); // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(newPasswordField);
    const c = passwordsEqual(newPasswordField,confirmPasswordField);
    return a && b && c
}

async function tryResetPassword(): Promise<void> {
    if (checkFields()) {
        const tempAlert: ChildNode | null = addTempAlert();
        try {
            const response: AxiosResponse<string> = await axios.post(`/reset_password/${pk}/${token}`, {'password' : newPasswordField.value}) as AxiosResponse<string>;
            const responseData: string = response.data;
            addAlert(`That worked. TODO: redirect`, AlertType.success, tempAlert)
        } catch (error) {
            addErrorAlert(error, tempAlert)
        }
    }
}

window.onload = () => {
    newPasswordButton.addEventListener("click",tryResetPassword)
}