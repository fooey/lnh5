import React from 'react';


import Layout from 'components/layout/main';
import BaseComponent from './index';


import * as PageMeta from './meta.js';





export default class HomeServer extends React.Component {
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
        return (
            <Layout
                head = {PageMeta.getHead(this.props.home)}
                scripts = {[]}
                containerType = 'none'
                crumbs = {PageMeta.getCrumbs(this.props.home)}
                error = {this.props.error}
            >

                <BaseComponent {...this.props} />

            </Layout>
        );
    }
}
