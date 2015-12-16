
import * as libDict from 'lib/dict';


export default class Extras {
    constructor(props) {
        this.initialDate = props.initial_date;
        this.legalName = props.legal_name;
        this.ownershipType = libDict.getOwnershipType(props.ownership_type_id);
        this.sprinklerStatus = libDict.getSprinklerStatus(props.sprinkler_status_id);
        this.numBeds = props.num_beds;
        this.numResidents = props.num_residents;
        this.isMedicare = props.is_medicare;
        this.isMedicaid = props.is_medicaid;
        this.inHospital = props.in_hospital;
        this.isCCRC = props.is_ccrc;
        this.isSFF = props.is_sff;
        this.newOwner = props.new_owner;
        this.hasResidentCouncil = props.has_resident_council;
        this.hasFamilyCouncil = props.has_family_council;
    }
}