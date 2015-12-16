import SurveyState from './survey-state';

export default class Survey extends SurveyState {
    constructor(props) {
        super(props);
        this.countyId = props.county_id;
    }
}
