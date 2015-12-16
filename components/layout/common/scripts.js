import React from 'react';


export default React.createClass({
    propTypes: {
        scripts: React.PropTypes.array,
        inlineScripts: React.PropTypes.array,
    },

    getDefaultProps: function() {
        return {
            scripts: [],
            inlineScripts: [],
        };
    },

    render: function() {
        const useMinified = (process.env.NODE_ENV !== 'development') || true;

        const baseScripts = [
            '//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery',
            '/nm/bootstrap-sass/assets/javascripts/bootstrap',
            '/nm/react/dist/react',
            '/dist/js/app',

        ];

        return (
            <div>
                {baseScripts.map(
                    (src, key) =>
                    (useMinified)
                        ? <script key={key} src={`${src}.min.js`} />
                        : <script key={key} src={`${src}.js`} />
                )}


                <script async={true} src='//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js' />


                {this.props.scripts.map(
                    (src, key) =>
                    <script key={key} src={src} />
                )}

                {this.props.inlineScripts.map(
                    (content, key) =>
                    <script key={key} dangerouslySetInnerHTML={{__html: content}} />
                )}
            </div>
        );
    },
});;
