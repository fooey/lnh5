import React from 'react';
import classnames from 'classnames';

import Icon from 'components/common/icon';

// import Icon from 'components/common/icon';

export default ({
    home,
    activeTab = 'home',
}) => {
    return (
        <ul className='nav-facility'>
            <li className={classnames({active: activeTab === 'home'})}>
                <a href={home.getLink('')}><Icon name='home fw' /> Facility Overview</a>
            </li>
            <li className={classnames({active: activeTab === 'reviews'})}>
                <a href={home.getLink('reviews')}><Icon name='comments fw' /> Read Reviews</a>
            </li>
            <li className={classnames({active: activeTab === 'submitReview'})}>
                <a href={home.getLink('submitReview')}><Icon name='commenting-o fw' /> Submit Review</a>
            </li>
            <li className={classnames({active: activeTab === 'jobs'})}>
                <a href={home.getLink('jobs')}><Icon name='clock-o fw' /> Jobs Available</a>
            </li>
            <li className={classnames({active: activeTab === 'volunteer'})}>
                <a href={home.getLink('volunteer')}><Icon name='hand-peace-o fw' /> Volunteer</a>
            </li>

            {/*<li className={classnames({dropdown: true, active: activeTab === 'reviews'})}>
                            <a className='dropdown-toggle' data-toggle='dropdown' href='#'>
                                reviews and ratings
                                <span className='caret'></span>
                            </a>
                            <ul className='dropdown-menu'>
                                <li><a href={home.getLink('reviews')}>read reviews</a></li>
                                <li><a href={home.getLink('submitReview')}>submitReview</a></li>
                                <li><a href={home.getLink('review', {reviewId: 1})}>review 1</a></li>
                                <li><a href={home.getLink('replies', {reviewId: 1})}>replies</a></li>
                                <li><a href={home.getLink('reply', {reviewId: 1, replyId: 1})}>reply 1</a></li>
                                <li><a href={home.getLink('submitReply', {reviewId: 1})}>submitReply</a></li>
                                <li><a href={home.getLink('rss')}>rss</a></li>
                            </ul>
                        </li>*/}

            <li className={classnames({dropdown: true, active: activeTab === 'inspection'})}>
                <a className='dropdown-toggle' data-toggle='dropdown' href={home.getLink('inspection')}>
                    <Icon name='caret-down fw' /> Inspection
                </a>
                <ul className='dropdown-menu'>
                    <li><a href={home.getLink('inspection')}><Icon name='bar-chart fw' /> inspections overview</a></li>
                    <li><a href={home.getLink('deficiencies')}><Icon name='warning fw' /> deficiencies</a></li>
                    <li><a href={home.getLink('complaints')}><Icon name='thumbs-o-down fw' /> complaints</a></li>
                    <li><a href={home.getLink('owners')}><Icon name='users fw' /> owners</a></li>
                    <li><a href={home.getLink('penalties')}><Icon name='money fw' /> penalties</a></li>
                    <li><a href={home.getLink('quality')}><Icon name='heart fw' /> quality</a></li>
                    <li><a href={home.getLink('staffing')}><Icon name='medkit fw' /> staffing</a></li>
                    {/*<li><a href={home.getLink('complaints')}>complaints</a></li>*/}
                </ul>
            </li>
        </ul>
    );
};
