import {isNumeric} from 'lib/num';


export function getRatingGroup(rating) {
    if (!isNumeric(rating)) {
        return 'null';
    }

    let roundedRating = Math.floor(rating * 2) / 2;
    let ratingGroup = (roundedRating * 20).toString();

    return ratingGroup;
}



export function getRatingClass(rating) {
    if (!isNumeric(rating)) {
        return 'rating-null';
    }

    return `rating-${getRatingGroup(rating)}-pct`;
}