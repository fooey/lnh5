import React from 'react';

export default React.createClass({
    propTypes: {
    },

    getDefaultProps: function() {
        return {
        };
    },

    render: function() {
        return (
            <footer className='container'>
                <div >
                    {Date.now()}
                </div>
            </footer>
        );
    },
});
