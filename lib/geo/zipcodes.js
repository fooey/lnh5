// import Zipcode from './zipcode.js';

import DAO from './dao/zipcodes';
import Zipcode from './zipcode';



function getByZipcode(zipcode, getCB) {
    console.log('lib::geo::zipcodes:getByZipcode()', zipcode);


    DAO.getByZipcode(zipcode, (err, data) => {
        if (err) {
            return getCB(err);
        }
        else {
            return getCB(
                err,
                data.map(d => new Zipcode(d))
            );
        }
    });
}



export default {
    getByZipcode,
};