import React from 'react';
// import numeral from 'numeral';
// import _ from 'lodash';
// import classnames from 'classnames';


// import STATIC_DICT from 'lib/dict/data';
// import {isNumeric} from 'lib/num';

// import libNav from 'lib/nav';


import Layout from 'components/layout/main';
import Breadcrumbs from 'components/layout/common/breadcrumbs';

// import Address from 'components/homes/common/address';
import FacilityNav from 'components/homes/common/nav';


// import Icon from 'components/common/icon';
// import Stars from 'components/common/stars';
// import AdSense from 'components/common/adsense';





export default class Home extends React.Component {
    static propTypes = {
    };

    constructor() {
        super();
    }


    render() {

        const props = this.props;



        const head = {
            title: 'FIXME',
            metas: getMeta(props.home),
            links: [],
        };


        let crumbs = [
            {label: 'Home', href: '/', icon: 'home'},
            // {label: 'Directory', href: '/directory'},
            {label: 'Directory', href: '/directory'},
        ];

        // if (props.home && props.home.hasOwnProperty('name')) {
        //     crumbs = crumbs.concat([
        //         {label: props.home.state.name, title: props.home.state.placeName, href: props.home.state.getLink()},
        //         {label: props.home.city.name, title: props.home.city.placeName, href: props.home.city.getLink()},
        //         {label: props.home.name, href: props.home.getLink()},
        //         {label: `Job Openings`, href: props.home.getLink('jobs'), active: true},
        //     ]);
        // }



        return (
            <Layout
                head = {head}
                scripts = {[]}
                containerType = 'none'
            >

                <Breadcrumbs crumbs={crumbs} />


                <section itemProp='about' itemScope='true' itemType='http://schema.org/LocalBusiness'>
                    <meta itemProp='additionalType' itemType='http://schema.org/MedicalOrganization' />
                    <meta itemProp='additionalType' itemType='http://schema.org/MedicalOrganization/NursingHome' />


                    {
                        (this.props.home)
                        ? <FacilityNav home={props.home} />
                        : <h1 className='error'>No home defined</h1>
                    }


                    {props.children ? <div>{props.children}</div> : null}


                </section>
            </Layout>
        );
    }
}

function getMeta(home) {
    return [{
        name: 'description',
        content: 'FIXME',
        itemProp: 'description',
    }, {
        rel: 'canonical',
        href: 'FIXME',
        itemProp: 'url',
    },];
}