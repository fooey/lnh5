
export let toTitleCase = require('titlecase');



export function phoneFormat(phone) {
    if (phone.length === 10) {
        return [
            phone.substring(0, 3),
            phone.substring(3, 6),
            phone.substring(6),
        ].join('-');
    }
    else {
        return phone;
    }
}



export function yesNoFormat(val) {
    return val ? 'Yes' : 'No';
}



export function deCamelCase(inStr) {
    return inStr
        .replace(/([A-Z])/g, ' $1')
        .replace(/^./, str => str.toUpperCase());
}