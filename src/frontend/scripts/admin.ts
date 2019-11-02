/**
 * admin.ts:
 * Contains code for the admin / teacher homepage
 */

/**
 * Imports
 */
import {getWhoamiPromise, initNavbar} from "./navbar";
import {UserRole, Whoami} from "./interfaces";

/**
 * Displays content of admin/teacher homepage
 */
export async function displayWhoami(): Promise<void> {
    const whoami: Whoami = await getWhoamiPromise();
    document.getElementById("content")!.innerHTML = `                <p class="text-center h1">Welcome, ${whoami.email}. (${UserRole[whoami.role]})</p>
                <p class="text-center h3">Please select an option from the links above</p>
                <div class="align-items-center center-block " id="alert-div"></div>`.trim()
}

/**
 * See [[initNavbar]]
 */
window.onload = () => {
    initNavbar(() => {
        return;
    });
    displayWhoami();
};