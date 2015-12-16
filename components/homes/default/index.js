import React from 'react';
import numeral from 'numeral';


import HomeClass from 'classes/homes/home';


import * as libString from 'lib/string';
import * as libRatings from 'lib/ratings';


import FacilityNav from 'components/homes/common/nav';
import Jumbo from 'components/homes/common/jumbo';


import ContainerRow from 'components/bootstrap/container-row';

import {FactList, FactRow} from 'components/common/factlist';
import Stars from 'components/common/stars';
import AdSense from 'components/common/adsense';






export default class Home extends React.Component {
    static propTypes = {
        home : React.PropTypes.object.isRequired,
        aggRatings : React.PropTypes.object.isRequired,
        extras : React.PropTypes.object.isRequired,
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
                {(props.extras && props.extras.legalName)
                    ? <meta itemProp='legalName' content={props.extras.legalName.toUpperCase()} />
                    : null
                }


                {(props.home && props.home instanceof HomeClass)
                    ? <Content
                        home={props.home}
                        aggRatings={props.aggRatings}
                        extras={props.extras}
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

                        {/*
                            <div>
                                <div>weightedScore: {props.home.weightedScore}</div>
                                <div>weightedScoreRank: {props.home.weightedScoreRank} / {props.home.state.num}</div>
                                <div>weightedScoreRankPct: {props.home.weightedScoreRankPct}</div>
                                <div>{props.home.weightedScoreRankPct
                                    ? props.home.weightedScoreRankPct <= 0.5
                                        ? <span>Top {numeral(props.home.weightedScoreRankPct).format('0.00%')} in {props.home.state.abbr}</span>
                                        : <span>Bottom {numeral(1 - props.home.weightedScoreRankPct).format('0.00%')} in {props.home.state.abbr}</span>
                                    : null
                                }</div>
                            </div>

                            */}

            </section>
        );
    }
}



const Content = ({
    home,
    aggRatings,
    extras,
}) => (
    <div>
        <Jumbo
            home={home}
            aggRatings={aggRatings}
        />


        <div className='container-wrapper'>
            <ContainerRow full={true}>
                <FacilityNav
                    home={home}
                    activeTab={'home'}
                />
            </ContainerRow>
        </div>


        {/*<div className='container-wrapper'>
                    <ContainerRow>
                        <div className='col-sm-12'>
                            <a href={home.getLink('reviews')} className='btn btn-default btn-block btn-lg'>
                                <span><Icon name='comments' /> Read User Reviews</span>
                            </a>
                        </div>
                        <div className='col-sm-12'>
                            <a href={home.getLink('submitReview')} className='btn btn-success btn-block btn-lg'>
                                <span><Icon name='commenting' /> Submit your review</span>
                            </a>
                        </div>
                    </ContainerRow>
                </div>*/}


        {/*<AdSense
                    slot='8560834784'
                    format='horizontal'
                />*/}


        <ContainerRow>
            <div className='col-sm-14 col-md-12'>
                <section className='ratings-overview'>
                    <RatingsOverview home={home} aggRatings={aggRatings} />
                </section>
            </div>
            <div className='col-sm-10 col-md-12'>
                <div className='flex-abg-container'>
                    {0
                        ? <AdSense slot='8560834784' format='vertical' />
                        : <img src='//nosrc.net/50' style={{width: '100%', height: '100%'}} />
                    }
                </div>
            </div>
        </ContainerRow>


        <div className='container-wrapper'>
            <ContainerRow full={true}>
                <ul className='list-unstyled'>
                    {Array.from({length: 11}).map(
                        (junk, i) =>
                        <li style={{width: '100%'}} key={i}>
                            <RatingsOverviewFigure rating={{
                                score: i * .5,
                                label: i * .5,
                            }} />
                        </li>
                    )}
                </ul>
            </ContainerRow>
        </div>


        <div className='container-wrapper container-wrapper-alt'>
            <ContainerRow full={true}>
                <QuickFacts home={home} extras={extras} />
            </ContainerRow>
        </div>



        <div className='container-wrapper container-wrapper-alt'>
            <ContainerRow full={true}>
                <FacilityNav home={home} />
            </ContainerRow>
        </div>
    </div>
);





const RatingsOverview = ({
    home,
    aggRatings,
}) => (
    <ul className='list-unstyled'>
        <li>
            <a href={home.getLink('reviews')}>
                <figure className={`${libRatings.getRatingClass(aggRatings.avgRating)}-bg`} >
                    <div>
                        <Stars num={aggRatings.avgRating} />
                    </div>
                    <figcaption>
                        <div>User Reviews</div>
                    </figcaption>
                </figure>
            </a>
        </li>
        {Object.keys(home.ratings).map(section =>
            <li key={section}>
                <RatingsOverviewFigure rating={home.ratings[section]} />
            </li>
        )}
    </ul>
);



const RatingsOverviewFigure = ({
    rating,
}) => {
    const ratingClass = libRatings.getRatingClass(rating.score);

    return (
        (rating.hasOwnProperty('score'))
            ? <a href={rating.link}>
                <figure
                    className={`${ratingClass}-bg`}
                    title={`${numeral(rating.score).format('0[.]0')}/5 Star CMS Rating for ${rating.label}`} >

                    <div><Stars num={rating.score} /></div>

                    <figcaption>
                        <div>{rating.label}</div>
                        {(rating.footnote) ? <div className='small'>* {rating.footnote.label}</div> : null}
                    </figcaption>

                </figure>
            </a>
            : <span />
    );
};




const QuickFacts = ({
    home,
    extras,
}) => (
    <div className='quick-facts'>
        <h2 className='page-header'>Quick Facts</h2>
        <FactList>
            <FactRow label='Federal Provider Number' detail={home.provnum} />
            <FactRow label='Name' detail={home.name} />
            <FactRow label='Legal Name' detail={libString.toTitleCase(extras.legalName)} />

            <FactRow label='Phone Number' detail={libString.phoneFormat(home.phoneNumber)} />
            <FactRow label='Street Address' detail={home.street} />
            <FactRow label='City' detail={home.city.name} />
            <FactRow label='State' detail={home.state.name} />
            <FactRow label='Zip Code' detail={home.zipcode.zipcode} />

            <FactRow label='Number of Certified Beds' detail={extras.numBeds} />
            <FactRow label='Number of Residents' detail={extras.numResidents} />

            <FactRow label='Ownership Type' detail={extras.ownershipType.label} />
            <FactRow label='Sprinkler Status' detail={extras.sprinklerStatus.label} />

            <FactRow label='isMedicare' detail={libString.yesNoFormat(extras.isMedicare)} />
            <FactRow label='isMedicaid' detail={libString.yesNoFormat(extras.isMedicaid)} />
            <FactRow label='inHospital' detail={libString.yesNoFormat(extras.inHospital)} />
            <FactRow label='isCCRC' detail={libString.yesNoFormat(extras.isCCRC)} />
            <FactRow label='isSFF' detail={libString.yesNoFormat(extras.isSFF)} />
            <FactRow label='newOwner' detail={libString.yesNoFormat(extras.newOwner)} />
            <FactRow label='hasResidentCouncil' detail={libString.yesNoFormat(extras.hasResidentCouncil)} />
            <FactRow label='hasFamilyCouncil' detail={libString.yesNoFormat(extras.hasFamilyCouncil)} />
        </FactList>
    </div>
);