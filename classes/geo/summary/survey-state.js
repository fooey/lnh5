import SurveyNation from './survey';

export default class Survey extends SurveyNation {
    constructor(props) {
        super(props);
        this.stateId = props.state_id;
    }
}
