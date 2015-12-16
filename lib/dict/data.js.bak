import _ from 'lodash';


import rawDeficiencies from 'data/static/dict/deficiencies.json';
import rawDeficiencyCorrections from 'data/static/dict/deficiency_corrections.json';
import rawFootnotes from 'data/static/dict/footnotes.json';
import rawMeasures from 'data/static/dict/measures.json';
import rawOwnerRoles from 'data/static/dict/owner_roles.json';
import rawOwnershipTypes from 'data/static/dict/ownership_types.json';
import rawSprinklerStatuses from 'data/static/dict/sprinkler_status.json';


const tmpDeficiencies = _.map(rawDeficiencies, d => {
    d.label = d.label.replace(/`/g, '"');
    return d;
});


const deficiencies = _.indexBy(tmpDeficiencies, 'id');
const deficiencyCorrections = _.indexBy(rawDeficiencyCorrections, 'id');
const footnotes = _.indexBy(rawFootnotes, 'id');
const measures = _.indexBy(rawMeasures, 'id');
const ownerRoles = _.indexBy(rawOwnerRoles, 'id');
const ownershipTypes = _.indexBy(rawOwnershipTypes, 'id');
const sprinklerStatuses = _.indexBy(rawSprinklerStatuses, 'id');



export {deficiencies};
export {deficiencyCorrections};
export {footnotes};
export {measures};
export {ownerRoles};
export {ownershipTypes};
export {sprinklerStatuses};

