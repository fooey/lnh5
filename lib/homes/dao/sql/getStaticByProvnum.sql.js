export default `
SELECT
    p.provnum
    , p.slug
    , p.name
    , p.phone_number
    , p.street

    , spn.num as nation_num

    , gs.state_id
    , gs.state_name
    , gs.state_abbr
    , gs.state_slug
    , sps.num as state_num

    , gco.county_id
    , gco.county_name
    , gco.county_slug
    , spco.num as county_num

    , gc.city_id
    , gc.city_name
    , gc.city_slug
    , spci.num as city_num

    , p.zipcode
    , spz.num as zipcode_num

    , weighted_score
    , weighted_score_rank
    , weighted_score_rank_pct

    , overall
    , health_inspection
    , quality_measures
    , staffing
    , staffing_rn

    , overall_footnote_id
    , health_inspection_footnote_id
    , quality_measures_footnote_id
    , staffing_footnote_id
    , staffing_rn_footnote_id
    , staffing_reported_footnote_id
    , staffing_therapy_footnote_id

FROM providers p
    LEFT JOIN ratings r on p.provnum = r.provnum

    LEFT JOIN summary.provider_nation spn ON 1=1 --intentional cross join

    LEFT JOIN geo.states gs ON p.state_id = gs.state_id
    LEFT JOIN summary.provider_state sps ON p.state_id = sps.state_id

    LEFT JOIN geo.counties gco
        ON p.state_id = gco.state_id
        AND p.county_id = gco.county_id
    LEFT JOIN summary.provider_county spco
        ON p.state_id = spco.state_id
        AND p.county_id = spco.county_id

    LEFT JOIN geo.cities gc
        ON p.state_id = gc.state_id
        AND p.city_id = gc.city_id
    LEFT JOIN summary.provider_city spci
        ON p.state_id = spci.state_id
        AND p.city_id = spci.city_id

    LEFT JOIN summary.provider_zipcode spz
        ON p.zipcode = spz.zipcode

WHERE p.provnum = $1::text;
`;