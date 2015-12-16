import React from 'react';

export default ({
    title,
    metas = [],
    links = [],
    ...props,
}) => (
    <head>
        <meta charSet='utf-8' />

        <title itemProp='name'>{title}</title>

        <meta name='viewport' content='width=device-width, initial-scale=1.0' />
        <meta name='theme-color' content='#00AEEF' />
        <meta name='image' content='/static/img/hands.png' value='/static/img/avatars/avatar120.png' />

        <meta itemProp='isFamilyFriendly' content='true' />
        <meta itemProp='inLanguage' content='en-US' />
        {metas.map((attribs, i) => <meta key={i} {...attribs} />)}

        <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css' />
        <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic|Roboto+Condensed:400,300,300italic,400italic,700,700italic' />


        <link rel='stylesheet' href='/dist/css/bootstrap.min.css' />
        <link rel='stylesheet' href='/dist/css/app.min.css' />


        {/*FIXME*/}
        {/*
            <link rel='shortcut icon' href='/static/img/favicon.163eaaa55a141677e801fd9f2cc60816.ico' />
            <link rel='apple-touch-icon-precomposed' href='/static/img/avatars/avatar57.5f36b169caa7792461236537a6b8524e.png' />
            <link rel='apple-touch-icon-precomposed' sizes='72x72' href='/static/img/avatars/avatar72.5f36b169caa7792461236537a6b8524e.png' />
            <link rel='apple-touch-icon-precomposed' sizes='114x114' href='/static/img/avatars/avatar114.5f36b169caa7792461236537a6b8524e.png' />
        */}

        {links.map((attribs, i) => <link key={i} {...attribs} />)}
    </head>
);
