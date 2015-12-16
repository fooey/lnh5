import React from 'react';

import numeral from 'numeral';

import {isNumeric} from 'lib/num';
import * as libDict from 'lib/dict';

import FacilityNav from 'components/homes/common/nav';

import ContainerRow from 'components/bootstrap/container-row';

import Stars from 'components/common/stars';
import Address from 'components/homes/common/address';


export default ({home, aggRatings}) => (
    <div className='jumbo'>
        <ContainerRow full={true}>

            <JumboHeader home={home} />

            <div className='row'>
                <div className='col-sm-12 text-center'>
                    <div itemProp='aggregateRating' itemScope='true' itemType='http://schema.org/AggregateRating'>
                        <meta itemProp='worstRating' content='1' />
                        <meta itemProp='bestRating' content='5' />

                        <JumboRating
                            rating = {aggRatings.avgRating}
                            label = 'User Rating'
                            link = {home.getLink('reviews')}
                            title = {`${numeral(aggRatings.avgRating).format('0[.]0')}/5 Star User Rating`}
                            extraDescription = {
                                (isNumeric(aggRatings.avgRating))
                                ? <div className='small'>
                                    <span itemProp='ratingValue'>{numeral(aggRatings.avgRating).format('0[.]0')}</span> stars -
                                    based on <span itemProp='ratingCount'>{aggRatings.numRatings}</span> ratings
                                    and <span itemProp='reviewCount'>{aggRatings.numReviews}</span> reviews
                                </div>
                                : <div className='small'>
                                    <meta itemProp='ratingCount' content='0' />
                                    <span itemProp='ratingValue' content='N/A'>
                                        * Not yet rated.
                                        {' '}
                                        <a href={home.getLink('submitReview')}>Submit yours!</a>
                                    </span>
                                </div>
                            }
                        />

                    </div>
                </div>
                <div className='col-sm-12 text-center'>
                    <JumboRating
                        rating = {home.ratings.overall.score}
                        label = 'CMS Overall Rating'
                        link = {home.getLink('inspection')}
                        title = {`${numeral(home.ratings.overall.score).format('0[.]0')}/5 Star CMS Rating`}
                        extraDescription = {
                            (home.ratings.overall.footnote)
                            ? <div className='small'>* {home.ratings.overall.footnote.label}</div>
                            : null
                        }
                    />
                </div>
            </div>

        </ContainerRow>
    </div>
);



export const JumboRating = ({
    rating,
    link,
    label,
    title,
    extraDescription,
}) => (
    <figure title={title}>
        <a href={link}>
            <Stars num={rating} supressRatingGroup={true} />
        </a>


        <figcaption>
            <div><a href={link}>{label}</a></div>
            {(extraDescription)
                ? extraDescription
                : null
            }
        </figcaption>
    </figure>

);




export const JumboHeader = ({home}) => {
    if (!home) {
        return null;
    }

    return (
        <header>
            <h1 itemProp='name'><a href={home.getLink()}>{home.name}</a></h1>

            <Address
                phoneNumber = {home.phoneNumber}
                street = {home.street}
                city = {home.city}
                state = {home.state}
                zipcode = {home.zipcode}
            />
                {/*county = {home.county}*/}
        </header>
    );
};