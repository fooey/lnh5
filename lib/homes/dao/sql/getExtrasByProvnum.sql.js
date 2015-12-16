export default `
SELECT
    initial_date
    , legal_name
    , num_beds
    , num_residents
    , is_medicare
    , is_medicaid
    , in_hospital
    , is_ccrc
    , is_sff
    , new_owner
    , has_resident_council
    , has_family_council
    , ownership_type_id
    , sprinkler_status_id
FROM providers_extras pe
WHERE pe.provnum = $1::text;
`;