export function ready(cb) {
    if (document.readyState !== 'loading') {
        cb();
    }
    else if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', cb);
    }
    else {
        document.attachEvent('onreadystatechange', function() {
            if (document.readyState !== 'loading') {
                cb();
            }
        });
    }
}
