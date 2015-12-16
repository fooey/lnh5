'use strict';

import LRU from 'lru-cache';

const CACHE_TIME_STATIC = 1000 * 60 * 60 * 4; // 4 hours
const CACHE_TIME_DYNAMIC = 1000 * 60 * 5; // 5 minutes


export let dict = LRU({
    max: 128,
    maxAge: CACHE_TIME_STATIC,
});



export let homesStatic = LRU({
    max: 128,
    maxAge: CACHE_TIME_STATIC,
});

export let homesStaticExtras = LRU({
    max: 32,
    maxAge: CACHE_TIME_STATIC,
});

export let homesSubmissions = LRU({
    max: 128,
    maxAge: CACHE_TIME_DYNAMIC,
});



export let geoStatic = LRU({
    max: 128,
    maxAge: CACHE_TIME_STATIC,
});

export let geoStaticExtras = LRU({
    max: 128,
    maxAge: CACHE_TIME_STATIC,
});


export let geoSubmissions = LRU({
    max: 128,
    maxAge: CACHE_TIME_DYNAMIC,
});
