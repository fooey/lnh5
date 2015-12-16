import React from 'react';

import Icon from 'components/common/icon';
import Logo from 'components/common/logo';



const MENU_ITEMS = [
    {
        label: 'Home',
        href: '/',
        icon: 'home',
    }, {
        label: 'Directory',
        href: '/directory',
        icon: 'map-marker',
    }, {
        label: 'Search',
        href: '/search',
        icon: 'search',
    }, {
        label: 'More',
        dropdown: true,
        items: [{
            label: 'User Reviews',
            href: '/FIXME',
            icon: 'heart',
        }, {
            label: 'Job Listings',
            href: '/FIXME',
            icon: 'clock-o',
        }, {
            label: 'Volunteering',
            href: '/FIXME',
            icon: 'hand-peace-o',
        }, {
            divider: true,
        }, {
            label: 'Contact Us',
            href: '/contact',
            icon: 'at',
        }, {
            label: 'Expert Care Advice',
            href: '/expert-advice',
            icon: 'phone',
        }, {
            divider: true,
        }, {
            label: 'Elder Abuse Resources',
            href: '/FIXME',
            icon: 'exclamation-triangle',
        }, {
            label: 'Inspection Results',
            href: '/FIXME',
            icon: 'bar-chart',
        }, {
            label: 'Articles and Resources',
            href: '/FIXME',
            icon: 'lightbulb-o',
        }],
    },
];



export default React.createClass({
    propTypes: {
        active: React.PropTypes.string,
    },

    getDefaultProps: function() {
        return {
            active: 'home',
        };
    },

    render: function() {

        return (
            <nav id='navbar' className='navbar navbar-default'>
                <div className='container-fluid'>
                    <div className='navbar-header'>

                        <a className='navbar-brand' href='/'>
                            <Logo height='60' itemProp='image' />
                            <span className='navbar-brand-name'>
                                {'Local Nursing Homes'.split(' ').join('\n')}
                            </span>
                        </a>

                        <a type='button' className='navbar-toggle collapsed' data-toggle='collapse' data-target='#navbar-collapse' aria-expanded='false' aria-controls='navbar'>
                            <span className='nav-collpase-label'>Menu </span>
                            <Icon name='bars' />
                        </a>

                    </div>

                    <div id='navbar-collapse' className='collapse navbar-collapse'>
                        <NavMenu items={MENU_ITEMS} />
                    </div>

                </div>
            </nav>
        );
    },
});



const NavMenu = React.createClass({
    propTypes: {
        label: React.PropTypes.string,
        href: React.PropTypes.string,
        icon: React.PropTypes.string,

        divider: React.PropTypes.bool,
        dropdown: React.PropTypes.bool,
        items: React.PropTypes.array,
    },

    getDefaultProps: function() {
        return {
            divider: false,
            dropdown: false,
            items: [],
        };
    },

    render: function() {
        if (this.props.items.length) {
            const submenu = this.props.items.map(
                (item, ix) => <NavMenu key={ix} {...item} />
            );

            if (this.props.dropdown) {
                return (
                    <NavDropdown label={this.props.label}>
                        {submenu}
                    </NavDropdown>
                );
            }
            else {
                return (
                    <ul className='nav navbar-nav navbar-right'>
                        {submenu}
                    </ul>
                );
            }
        }
        else if (this.props.divider) {
            return <NavDivider />;
        }
        else {
            return (
                <NavItem
                    href={this.props.href}
                    label={this.props.label}
                    icon={this.props.icon}
                />
            );
        }
    },
});



const NavItem = ({
    label,
    href,
    icon,
}) => (
    <li>
        <a href={href}>
            {icon
                ? <span className='nav-icon'><Icon name={icon} /> </span>
                : null}
            {label}
        </a>
    </li>
);



const NavDivider = () => (
    <li role='separator' className='divider' />
);




const NavDropdown = ({
    children,
    label,
}) => (
    <li className='dropdown'>
        <a href='#' className='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>
            <span className='nav-icon'><Icon name='caret-down' /> </span>
            {label}
        </a>
        <ul className='dropdown-menu'>
            {children}
        </ul>
    </li>
);
