/**
 * main.ts:
 * Contains some settings and global imports
 */

/**
 * Imports from other files
 */
import "../sass/main.sass"
import axios, {AxiosError, AxiosResponse} from "axios";
import "popper.js"
import "bootstrap"

/**
 * Makes axios use url prefix found in template included in base.html (which all other pages extend)
 */
export const urlPrefix: string = document.getElementById("url-prefix")!.classList[0]!;

axios.defaults.baseURL = urlPrefix;
// tslint:disable-next-line:no-default-export
export default axios;
export {AxiosResponse};
export {AxiosError};