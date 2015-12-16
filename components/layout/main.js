import React from 'react';
import classnames from 'classnames';

import Head from './common/head.js';
import Navbar from './common/navbar.js';
import Footer from './common/footer.js';
import Scripts from './common/scripts.js';

import Breadcrumbs from 'components/layout/common/breadcrumbs';
import ErrorComponent from 'components/error';


export default React.createClass({
    propTypes: {
        children: React.PropTypes.element.isRequired,

        head: React.PropTypes.object.isRequired,
        scripts: React.PropTypes.array,
        crumbs: React.PropTypes.array,

        containerType: React.PropTypes.string,

        error: React.PropTypes.object,
    },

    getDefaultProps: function() {
        return {
            head: {},
            scripts: [],
            containerType: 'default',
        };
    },

    render: function() {

        return (
            <html>
                <Head {...this.props.head} />

                <body>

                    <Navbar active='home' />

                    <ContentContainer containerType={this.props.containerType}>
                        <div id='content' itemProp='mainContentOfPage'>

                            {(this.props.crumbs && Array.isArray(this.props.crumbs))
                                ? <Breadcrumbs crumbs={this.props.crumbs} />
                                : null
                            }

                            {(this.props.error)
                                ? <div style={{marginTop: '2rem'}}>
                                    <ErrorComponent {...this.props.error.props} />
                                </div>
                                : null
                            }

                            {this.props.children}
                        </div>
                    </ContentContainer>


                    <Footer />

                    <Scripts
                        scripts = {this.props.scripts}
                        inlineScripts = {[]} />

                </body>
            </html>
        );
    },
});


const ContentContainer = ({containerType, children}) => {
    if (containerType === 'none') {
        return children;
    }
    else {
        const containerClass = classnames({
            container: containerType === 'default',
            'container-fluid': containerType === 'fluid',
        });

        return (
            <div className={containerClass}>
                <div className='row'>
                    <div className='col-lg-24'>
                        {children}
                    </div>
                </div>
            </div>
        );

    }
};
