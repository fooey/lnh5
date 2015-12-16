import React from 'react';

const baseWidth = '256';
const baseHeight = '234';

export default ({
    color,
    width,
    height,
}) => {

    if (height && !width) {
        width = height / baseHeight * baseWidth;
    }
    else if (width && !height) {
        height = width / baseWidth * baseHeight;
    }

    return (
        <svg
            xmlns='http://www.w3.org/2000/svg'
            width={width || baseWidth}
            height={height || baseHeight}
            viewBox='0 0 204.8 187.2'
            className='logo'
        >
            <path
                fill={color}
                d='M41.514 0c-.208-.003-.414.02-.625.042-1.69.173-3.4 1.14-4.25 2.54-1.07 2.833 1.13 5.173 2.41 7.456 9.35 14.427 17.28 29.77 27.83 43.397-11.65 10.08-20.617 22.9-27.33 36.693-6.5-4.832-13.077-9.596-19.21-14.91-5.367-4.6-9.79-10.17-15.29-14.62-2.85 1.384-6.01 3.7-4.792 7.33 10.116 12.83 23.765 22.24 36.83 31.82 1.4 12.595 4.15 25.248 9.5 36.776-1.417 1.8-3.317 3.348-4.084 5.58-.516 4.882 6.075 9.305 9.96 5.623 6.315-5.73 13.98-9.48 21.414-13.494 4.768-2.732 1.268-10.928-3.83-10.495-4.984.466-9.017 3.898-13.417 5.997-4-11.278-7.24-22.89-7.707-34.9C55.06 82.54 63.135 71.16 73.22 61.765c3.55 1.783 7.023 3.707 10.456 5.706-8.4 8.35-15.873 17.57-23.29 26.78-2.416 3-.724 7.11 1.46 9.71 7.148 10.33 20.706 13.29 32.538 11.707 9.066 16.243 15.532 33.885 26.33 49.145 1.567 2.05 3.142 4.64 6.042 4.706 4.4 1.067 9.45-4.24 6.25-8.29-11.216-15.29-17.957-33.2-27.04-49.726 2.033-1.285 4.066-2.534 6.083-3.83 7.33 16.223 13.8 33.374 25.99 46.684 4.265 4.68 12.006-1.36 9.706-6.79-1.75-3.13-4.266-5.715-6.5-8.498 7.533-5.497 14.85-11.286 21.916-17.367 11.232-9.365 25.256-14.16 38.455-19.99 4.85-1.636 3.99-10.724-1.54-10.29-12.43 4.547-24.857 9.544-36.12 16.575-1.8-12.045-4.118-24.24-10-35.068 11.68-6.08 22.072-15.06 28.622-26.572 2.915-4.63-5.076-9.737-7.71-4.706-5.765 8.742-13.265 16.314-22.414 21.53-11.03-4.167-22.196-8.715-34.08-9.66-8.764-.77-17.363 1.94-24.83 6.37-5.2-4.55-11.665-7.016-17.58-10.33C63.54 35.267 55.69 17.742 45.056 2.164 44.35.7 42.975.025 41.515 0zm73.91 65.555c11.108-.267 22.304 5.27 32.665 8.83 7.28 11.594 9.19 25.413 11.12 38.69-7.57 6.098-14.95 12.454-22.92 18.035-4.6-8.647-8.334-17.71-12.5-26.572 5.216 3.115 12.066 5.672 17.75 2.124 3.315-1.416 1.15-7.622-2.25-5.123-6.684 3.54-13.06-1.94-17.458-6.5.683-3.23 3.025-7.08.375-10-2.7-3.618-9.524-3.33-10.54 1.58-4.167 15.925-26.68 23.414-38.914 11.786C82.09 87.216 91.15 74.88 104.38 68.05c3.646-1.665 7.338-2.41 11.04-2.5zm-29.538 51.103c-.66-.017-1.32.103-2 .374-2.85.717-5.266 3.865-4.25 6.83 4.516 16.96 14.707 31.545 24.373 45.94 2.76 3.997 5.08 8.37 8.41 11.952 4.6 3.215 12.4-2.174 9.08-7.455-10.567-16.96-23.858-32.72-29.79-52.15-.515-2.87-2.98-5.43-5.83-5.5zM78.01 135.69c-.683.08-1.394.355-2.124.792-8.515 5.78-18.148 10.346-24.83 18.41-3.667 4.047-.117 11.677 5.5 10.91 2.665-1.215 4.315-3.823 6.498-5.705 5.716-5.68 13.566-8.496 19.5-13.91 3.6-3.645.25-11.048-4.543-10.496zm6.876 13.828c-1.442.03-2.84.583-3.917 1.79-6.47 6.265-13.85 11.58-19.92 18.243-3.47 4.59 2.26 11.28 7.46 9 5.6-4.25 10.44-9.44 15.95-13.82 2.75-2.73 6.916-5.023 7.083-9.37-.185-3.45-3.495-5.9-6.667-5.83zm7.582 15.91c-1.126-.04-2.25.225-3.25.916-5.15 3-9.807 6.99-13.54 11.62-2.65 3.398.492 8.98 4.625 9.163 4.566.733 6.782-4.215 10-6.498 2.665-2.84 7.832-3.99 8.165-8.42.675-3.638-2.62-6.667-6-6.79z'
            />
        </svg>
    );
};