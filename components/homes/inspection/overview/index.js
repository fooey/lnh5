import React from 'react';
import numeral from 'numeral';
import moment from 'moment';
import _ from 'lodash';

import * as libString from 'lib/string';

import HomeClass from 'classes/homes/home';

import InspectionNav from 'components/homes/inspection/common/inspection-nav';

import FacilityNav from 'components/homes/common/nav';
import Jumbo from 'components/homes/common/jumbo';
// import {FactList, FactRow} from 'components/common/factlist';
// import {FactTable, FactTableRow} from 'components/common/facttable';


import ContainerRow from 'components/bootstrap/container-row';
import Icon from 'components/common/icon';

// import Stars from 'components/common/stars';
// import AdSense from 'components/common/adsense';


const DEFAULT_ITEM_FORMAT = {
    format: ',.[00]',
    rankOrder: 'ascending',
    aggregates: ['avg', 'sum', 'min', 'max', 'rank'],
};

const SURVEY_ITEMS = {
    totalWeightedHealthSurveyScore: _.defaults({aggregates: ['avg', 'min', 'max', 'rank']}, DEFAULT_ITEM_FORMAT),
    numberOfFacilityReportedIncidents: _.defaults({}, DEFAULT_ITEM_FORMAT),
    numberOfSubstantiatedComplaints: _.defaults({}, DEFAULT_ITEM_FORMAT),
    numberOfFines: _.defaults({}, DEFAULT_ITEM_FORMAT),
    totalAmountOfFinesInDollars: _.defaults({format: '$,.[00]'}, DEFAULT_ITEM_FORMAT),
    numberOfPaymentDenials: _.defaults({}, DEFAULT_ITEM_FORMAT),
    totalNumberOfPenalties: _.defaults({}, DEFAULT_ITEM_FORMAT),
};
const SURVEY_CYLE_ITEMS = {
    totalNumberOfHealthDeficiencies: _.defaults({}, DEFAULT_ITEM_FORMAT),
    numberOfStandardHealthDeficiencies: _.defaults({}, DEFAULT_ITEM_FORMAT),
    numberOfComplaintHealthDeficiencies: _.defaults({}, DEFAULT_ITEM_FORMAT),
    healthDeficiencyScore: _.defaults({}, DEFAULT_ITEM_FORMAT),
    numberOfHealthRevisits: _.defaults({}, DEFAULT_ITEM_FORMAT),
    healthRevisitScore: _.defaults({}, DEFAULT_ITEM_FORMAT),
    totalHealthScore: _.defaults({}, DEFAULT_ITEM_FORMAT),
};






export default class Home extends React.Component {
    static propTypes = {
        home : React.PropTypes.object.isRequired,
        aggRatings : React.PropTypes.object.isRequired,
        survey : React.PropTypes.object.isRequired,
        surveySummary : React.PropTypes.object.isRequired,

        error: React.PropTypes.object,
    };

    constructor() {
        super();
    }


    render() {
        const props = this.props;

        return (
            <section itemProp='about' itemScope='true' itemType='http://schema.org/LocalBusiness'>
                <meta itemProp='additionalType' itemType='http://schema.org/MedicalOrganization' />
                <meta itemProp='additionalType' itemType='http://schema.org/MedicalOrganization/NursingHome' />


                {(props.home && props.home instanceof HomeClass)
                    ? <Content
                        home={props.home}
                        aggRatings={props.aggRatings}
                        survey={props.survey}
                        surveySummary={props.surveySummary}
                    />
                    : null
                }


                {(props.error)
                    ? <h1>Error</h1>
                    : null
                }


                {(props.children)
                    ? (
                        <ContainerRow full={true}>
                            {props.children ? <div>{props.children}</div> : null}
                        </ContainerRow>
                    )
                    : null
                }


                {/*<script dangerouslySetInnerHTML={{__html: JSON.stringify({
                    home: this.props.home,
                    aggRatings: this.props.aggRatings,
                    survey: this.props.survey,
                    surveySummary: this.props.surveySummary,
                }, null, '\t')}} />*/}
            </section>
        );
    }
}



const Content = ({
    home,
    aggRatings,
    survey,
    surveySummary,
}) => (
    <div>
        <Jumbo
            home={home}
            aggRatings={aggRatings}
        />

        <div className='container-wrapper'>
            <ContainerRow>

                <FacilityNav
                    home={home}
                    activeTab='inspection'
                />

                <InspectionNav
                    home={home}
                    activeTab='overview'
                />

                <h1>Inspections Overview</h1>

                <SurveyResults
                    home={home}
                    survey={survey}
                    surveySummary={surveySummary}
                />

            </ContainerRow>
        </div>


        <div className='container-wrapper container-wrapper-alt'>
            <ContainerRow full={true}>
                <FacilityNav
                    home={home}
                />
            </ContainerRow>
        </div>

    </div>
);


const SurveyResults = ({
    home,
    survey,
    surveySummary,
}) => {

    let rows = [];
    _.forEach(SURVEY_ITEMS,
        (item, itemKey) => {
            rows.push(
                <tr key={itemKey}>
                    <th
                        title = {libString.deCamelCase(itemKey)}
                    >
                        <span>{libString.deCamelCase(itemKey)}</span>
                        <span className='detail-expanders'>
                            <label htmlFor={itemKey + '-ranking'} className='btn btn-xs btn-info'>Ranking</label>
                            <label htmlFor={itemKey + '-compare'} className='btn btn-xs btn-info'>Compare</label>
                        </span>
                    </th>
                    <td style={{textAlign: 'right'}}>{numeral(_.get(survey, [itemKey, 'val'])).format(item.format)}</td>
                    {['city', 'county', 'state', 'nation'].map(
                        (geo) =>
                        <td
                            key = {geo}
                            style = {{textAlign: 'right'}}
                            title = {_.get(survey, [itemKey, 'rank', geo])}
                        >
                            <span>{
                                numeral(_.get(survey, [itemKey, 'rank', geo]))
                                .format(geo === 'nation' ? '0.[0]a' : ',')
                            }</span>
                            <small className='muted'>/{
                                numeral(_.get(home, [geo, 'num']))
                                .format(geo === 'nation' ? '0.[0]a' : ',')
                            }</small>
                        </td>
                    )}
                </tr>
            );
            rows.push(
                <tr key={itemKey + '-ranking'} className='ranking'>
                    <th>
                        <input type='checkbox' id={itemKey + '-ranking'} className='detail-toggle' />
                        <span>ranking</span>
                    </th>
                    <td colSpan = {5}>ranking</td>
                </tr>
            );
            rows.push(
                <tr key={itemKey + '-compare'} className='compare'>
                    <th>
                        <input type='checkbox' id={itemKey + '-compare'} className='detail-toggle' />
                        <span>compare</span>
                    </th>
                    <td colSpan = {5}>compare</td>
                </tr>
            );
        }
    );

    return (
        <ContainerRow full={true}>

            <section className='survey-results'>
                <table className='table'>
                    <thead>
                        <tr>
                            <th>Measure</th>
                            <th style={{textAlign: 'right'}}>Value</th>
                            {['City', 'County', 'State', 'Nation'].map(
                                (geo) =>
                                <th
                                    style={{textAlign: 'right'}}
                                    key={geo}
                                    title={home[geo.toLowerCase()].placeName}
                                >
                                    <a href={home[geo.toLowerCase()].getLink()}>{geo}</a>
                                </th>
                            )}
                        </tr>
                    </thead>
                    <tbody>
                        {rows}
                    </tbody>
                </table>
            </section>

        </ContainerRow>
    )
};




/*
        <section className='survey-results'>
            <SurveyResultsSection title={`Survey Overview`}>

                {_.map(SURVEY_ITEMS,
                    (item, itemKey) =>
                    <SurveyResultsItem
                        key = {itemKey}
                        home = {home}
                        survey = {survey}
                        surveySummary = {surveySummary}
                        rankOrder = {item.rankOrder}
                        label = {libString.deCamelCase(itemKey)}
                        itemKey = {[...itemKey]}
                        aggs = {item.aggregates}
                    />
                )}
            </SurveyResultsSection>
        </section>

        <section className='survey-results'>
            {_.map(survey.cycles, (cycle, cycleNumber) =>
                <SurveyResultsSection
                    key = {cycleNumber}
                    title = {`Cycle ${cycleNumber}: ${moment(cycle.standardSurveyHealthDate).format('MMMM YYYY')}`}
                >
                    {_.map(SURVEY_CYLE_ITEMS, (item, itemKey) =>
                        <SurveyResultsItem
                            key = {itemKey}
                            home = {home}
                            survey = {survey}
                            surveySummary = {surveySummary}
                            label = {libString.deCamelCase(itemKey)}
                            rankOrder = {item.rankOrder}
                            itemKey = {['cycles', cycleNumber, itemKey]}
                            aggs = {item.aggregates}
                        />
                    )}
                </SurveyResultsSection>
            )}
        </section>
*/





const SurveyResultsSection = ({
    title,
    ...props,
}) => (
    <section className='survey-results-section'>
        <h1>{title}</h1>
        <div>{props.children}</div>
    </section>
);



const SurveyResultsItem = ({
    label = libString.deCamelCase(itemKey),
    rankOrder,
    home,
    survey,
    surveySummary,
    itemKey,
    aggs,
    format = '0,0.[00]',
}) => (
    <div className='survey-results-item'>
        <div className=''>
            <SurveyResultsItemHeader
                label = {label}
                survey = {survey}
                itemKey = {itemKey}
                format = {format}
                rankOrder = {rankOrder}
            />
        </div>
        <div className=''>
            <SurveyResultsItemFacility
                home = {home}
                survey = {survey}
                itemKey = {itemKey}
            />
            <SurveyResultsItemGeo
                home = {home}
                surveySummary = {surveySummary}
                itemKey = {itemKey}
                aggs = {aggs}
                format = {format}
            />
        </div>
    </div>
);



const SurveyResultsItemHeader = ({
    label,
    survey,
    itemKey,
    format,
    rankOrder,
}) => (
    <h2>
        {label}: {numeral(_.get(survey, [...itemKey, 'val'])).format(format)}

        {(rankOrder) ? ' ' : null }
        {(rankOrder === 'ascending') ? <Icon name='angle-double-down' title='Lower is better' /> : null }
        {(rankOrder === 'descending') ? <Icon name='angle-double-up' title='Higher is better' /> : null }
    </h2>
);



const SurveyResultsItemFacility = ({
    home,
    survey,
    itemKey,
}) => (
    <div className='facility'>
        <input type='checkbox' className='check-toggler' id={`check-toggler-rankings-${itemKey}`} />
        <label htmlFor={`check-toggler-rankings-${itemKey}`}>Facility Rankings <Icon name='' /></label>

        <div className='geo-ranks check-toggled'>{
            [
                'city',
                'county',
                'state',
                'nation',
            ].map(
                (geo) =>
                (home[geo].isRankable)
                    ? <div key={geo} className='geo-ranks-item'>
                        <div>
                            <span>Ranked #{_.get(survey, [...itemKey, 'rank', geo])}</span>
                            {' '}
                            <span>in <a href={home[geo].getLink()}>{home[geo].placeName}</a></span>
                            {(home[geo].isRankable)
                                ? <small> (of {numeral(_.get(home, [geo, 'num'])).format(',')})</small>
                                : null
                            }
                        </div>
                    </div>
                    : null
            )
        }</div>
    </div>
);



const SurveyResultsItemGeo = ({
    home,
    surveySummary,
    itemKey,
    aggs,
    format,
}) => (
    <div className='geo'>
        <input type='checkbox' className='check-toggler' id={`check-toggler-geo-${itemKey}`} />
        <label htmlFor={`check-toggler-geo-${itemKey}`}>Regional Comparison <Icon name='' /></label>

        <table className='table table-condensed small geo-aggregates check-toggled'>
            <thead><tr>
                <th>Region</th>
                {aggs.map(
                    agg =>
                    <th
                        className='geo-aggregates-item'
                        style={{textAlign: 'right'}}
                        key={agg}
                        children={agg}
                    />
                )}
            </tr></thead>
            <tbody>{
                [
                    'city',
                    'county',
                    'state',
                    'nation',
                ].map(
                    (geo) =>
                    (home[geo].isRankable)
                        ? <tr key={geo} className='geo-aggregates-row'>
                            <th>
                                <a href={home[geo].getLink()} children={home[geo].placeName} />
                            </th>
                            {aggs.map(
                                agg =>
                                <td
                                    key={agg}
                                    className='geo-aggregates-item'
                                    style={{textAlign: 'right'}}
                                    children={numeral(_.get(surveySummary, [geo, ...itemKey, agg])).format(agg === 'rank' ? ',.[00]' : format)}
                                />
                            )}
                        </tr>
                        : null
                )
            }</tbody>
        </table>

    </div>
);






/*
const getSurveySummaryColumns = ({
    surveySummary,
    key,
    format = ',.[00]',
}) => (
    [
        'city',
        'county',
        'state',
        'nation',
    ].map(
        (geo) =>
        getSurveySummaryCell({surveySummary, key, format, geo})
    )
);



const getSurveySummaryCell = ({
    surveySummary,
    key,
    format,
    geo,
}) => (
    <div className='survey-summary-cell' style={{textAlign: 'left'}}>
        <div>
            <span className='label'>Avg:</span>
            <span className='detail'>{numeral(_.get(surveySummary, [geo, key, 'avg'], null)).format(format)}</span>
        </div>
        <div>
            <span className='label'>Total:</span>
            <span className='detail'>{numeral(_.get(surveySummary, [geo, key, 'sum'], null)).format(format)}</span>
        </div>
        <div>
            <span className='label'>Min:</span>
            <span className='detail'>{numeral(_.get(surveySummary, [geo, key, 'min'], null)).format(format)}</span>
        </div>
        <div>
            <span className='label'>Max:</span>
            <span className='detail'>{numeral(_.get(surveySummary, [geo, key, 'max'], null)).format(format)}</span>
        </div>
        <div>
            <span className='label'>Rank:</span>
            <span className='detail'>{numeral(_.get(surveySummary, [geo, key, 'rank'], null)).format(format)}</span>
        </div>
        <div>
            <span className='label'>RankPct:</span>
            <span className='detail'>{numeral(_.get(surveySummary, [geo, key, 'rankPct'], null)).format('[0%]')}</span>
        </div>
    </div>
);
*/





                {/*

                <FactTable
                    header={[
                        {label: `Survey Overview`},
                        {label: `Facility`},
                        {label: `City`},
                        {label: `County`},
                        {label: `State`},
                        {label: `Nation`},
                    ]}
                    rows={[
                        {
                            label: <span>Total Weighted Health Survey Score <Icon name='angle-double-up' title='Lower is better' /></span>,
                            title: `Total Weighted Health Survey Score`,
                            detail: [
                                numeral(survey.totalWeightedHealthSurveyScore).format(',.[00]'),
                                ...getSurveySummaryColumns({surveySummary, key: 'totalWeightedHealthSurveyScore'}),
                            ],
                        }, {
                            label: `Number Of Facility Reported Incidents`,
                            href: home.getLink('deficiencies'),
                            detail: [
                                numeral(survey.numberOfFacilityReportedIncidents).format(',.[00]'),
                                ...getSurveySummaryColumns({surveySummary, key: 'numberOfFacilityReportedIncidents'}),
                            ],
                        }, {
                            label: `Number Of Substantiated Complaints`,
                            href: home.getLink('complaints'),
                            detail: [
                                numeral(survey.numberOfSubstantiatedComplaints).format(',.[00]'),
                                ...getSurveySummaryColumns({surveySummary, key: 'numberOfSubstantiatedComplaints'}),
                            ],
                        }, {
                            label: `Number Of Fines`,
                            href: home.getLink('penalties'),
                            detail: [
                                survey.numberOfFines,
                                ...getSurveySummaryColumns({surveySummary, key: 'numberOfFines'}),
                            ],
                        }, {
                            label: `Total Amount Of Fines In Dollars`,
                            href: home.getLink('penalties'),
                            detail: [
                                numeral(survey.totalAmountOfFinesInDollars).format('$,.[00]'),
                                ...getSurveySummaryColumns({surveySummary, key: 'totalAmountOfFinesInDollars', format: '$,.[00]'}),
                            ],
                        }, {
                            label: `Number Of Payment Denials`,
                            href: home.getLink('penalties'),
                            detail: [
                                survey.numberOfPaymentDenials,
                                ...getSurveySummaryColumns({surveySummary, key: 'numberOfPaymentDenials'}),
                            ],
                        }, {
                            label: `Total Number Of Penalties`,
                            href: home.getLink('penalties'), detail: [
                                survey.totalNumberOfPenalties,
                                ...getSurveySummaryColumns({surveySummary, key: 'totalNumberOfPenalties'}),
                            ],
                        },
                    ]}
                />
                */}





            {/*_.map(survey.cycles,
                (cycle, cycleNumber) =>
                <section key={cycleNumber} className='survey-facts'>
                    <FactTable
                        header={[
                            {label: `Cycle ${cycleNumber} — ${moment(cycle.standardSurveyHealthDate).format('MM/DD/YYYY')}`},
                            {label: `Facility`},
                            {label: `City`},
                            {label: `County`},
                            {label: `State`},
                            {label: `Nation`},
                        ]}
                        rows={[
                            {label: `Total Number Of Health Deficiencies`, detail: cycle.totalNumberOfHealthDeficiencies, href: home.getLink('deficiencies')},
                            {label: `Number Of Standard Health Deficiencies`, detail: cycle.numberOfStandardHealthDeficiencies, href: home.getLink('deficiencies')},
                            {label: `Number Of Complaint Health Deficiencies`, detail: cycle.numberOfComplaintHealthDeficiencies, href: home.getLink('deficiencies')},
                            {label: `Health Deficiency Score`, detail: cycle.healthDeficiencyScore, href: home.getLink('deficiencies')},
                            {label: `Number Of Health Revisits`, detail: cycle.numberOfHealthRevisits},
                            {label: `Health Revisit Score`, detail: cycle.healthRevisitScore},
                            {label: `Total Health Score`, detail: cycle.totalHealthScore},
                        ]}
                    />
                </section>
            )*/}