
import { Dialog } from '@syncfusion/ej2-popups';
import { Button } from '@syncfusion/ej2-buttons';
/**
 * Dialog template sample
 */

let icontemp: string = '<button id="sendButton" class="e-control e-btn e-primary" data-ripple="true">' + 'Send</button>';
let headerimg: string = '<img class="img2" style="display: inline-block;" src="https://ej2.syncfusion.com/products/typescript/dialog/template/images/1.png" alt="header image">';
let sendbutton: Button = new Button();
let proxy: any = this;

// Initialize Dialog component
let dialog = new Dialog({
    // Enables the header with template content
    header: headerimg + '<div class="dlg-template" title="Nancy" class="e-icon-settings"> Nancy </div>',
    // Enables the footer with template content
    footerTemplate: ' <input id="inVal" class="e-input" type="text" placeholder="Enter your message here!"/>' + icontemp,
    // Dialog content
    content: document.getElementById("dlgContent"),
    // Enables the close icon button in header
    showCloseIcon: true,
    // The Dialog shows within the target element
    target: document.getElementById("container"),
    //Dialog width
    width: '400px',
    height: '250px',
    beforeOpen: onBeforeopen
});
// Render initialized Dialog
dialog.appendTo('#dialog');
sendbutton.appendTo('#sendButton');

// Sample level code to handle the button click action
document.getElementById('targetButton').onclick = (): void => {
    // Call the show method to open the Dialog
    dialog.show();
}

(document.getElementById('sendButton')as HTMLElement).onkeydown = (e: any) => {
    if (e.keyCode === 13) { updateTextValue(); }
};

(document.getElementById('inVal')as HTMLElement).onkeydown = (e: any) => {
    if (e.keyCode === 13) { updateTextValue(); }
};

document.getElementById('sendButton').onclick = (): void => {
    updateTextValue();
};

function onBeforeopen(): void {
    document.getElementById('dlgContent').style.visibility = 'visible';
}

function updateTextValue () : void {
    let enteredVal: HTMLInputElement = document.getElementById('inVal') as HTMLInputElement;
    let dialogTextElement: HTMLElement = document.getElementsByClassName('dialogText')[0] as HTMLElement;
    let dialogTextWrap : HTMLElement = document.getElementsByClassName('dialogContent')[0] as HTMLElement;
    if (enteredVal.value !== '') {
        dialogTextElement.innerHTML = enteredVal.value;
        enteredVal.value = '';
    }
}
