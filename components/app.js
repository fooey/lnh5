'use strict';

import React from 'react';
import Hello from './hello.js';

import {ready as domReady} from 'lib/dom.js';

// console.clear();

domReady(() => {
    console.log(Date.now(), 'dom ready');
});


// React.render(
//     <Hello />,
//     document.getElementById('app'),
// );
