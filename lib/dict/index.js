
import _ from 'lodash';

import * as STATIC_DICT from 'lib/dict/dao';


function getStaticSet(key, getCB) {
    // console.log('lib::dict:getStatic()', key);

    const result = _.get(STATIC_DICT, key);

    if (getCB && typeof getCB === 'function') {
        return getCB(null, result);
    }
    else {
        return result;
    }
}


function getStatic(key, id, getCB) {
    // console.log('lib::dict:getStatic()', key, id);

    const result = _.get(STATIC_DICT, [key, id]);

    if (getCB && typeof getCB === 'function') {
        return getCB(null, result);
    }
    else {
        return result;
    }
}




export function getDeficiencies(getCB) {
    return getStaticSet('deficiencies', getCB);
}
export function getDeficiency(id, getCB) {
    return getStatic('deficiencies', id, getCB);
}



export function getDeficiencyCorrections(getCB) {
    return getStaticSet('deficiencyCorrections', getCB);
}
export function getDeficiencyCorrection(id, getCB) {
    return getStatic('deficiencyCorrections', id, getCB);
}



export function getFootnotes(getCB) {
    return getStaticSet('footnotes', getCB);
}
export function getFootnote(id, getCB) {
    return getStatic('footnotes', id, getCB);
}



export function getMeasures(getCB) {
    return getStaticSet('measures', getCB);
}
export function getMeasure(id, getCB) {
    return getStatic('measures', id, getCB);
}



export function getOwnerRoles(getCB) {
    return getStaticSet('ownerRoles', getCB);
}
export function getOwnerRole(id, getCB) {
    return getStatic('ownerRoles', id, getCB);
}



export function getOwnershipTypes(getCB) {
    return getStaticSet('ownershipTypes', getCB);
}
export function getOwnershipType(id, getCB) {
    return getStatic('ownershipTypes', id, getCB);
}



export function getSprinklerStatuses(getCB) {
    return getStaticSet('sprinklerStatuses', getCB);
}
export function getSprinklerStatus(id, getCB) {
    return getStatic('sprinklerStatuses', id, getCB);
}




// export {STATIC_DICT};