import "../sass/desktop.sass"
import axios, {AxiosResponse} from 'axios';
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import {Alert, generateAlertHTML} from "./error";


const registerButton: HTMLButtonElement = document.getElementById("register-button") as HTMLButtonElement;

const registerJSON = 	{
	"email":"asdfasdf2",
	"password":"test205",
	}
//
window.onload = () => {
	console.log("test")
}