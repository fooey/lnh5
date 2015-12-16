export default `
SELECT
    COUNT(ratings.id) as num_ratings
    , COUNT(reviews.id) AS num_reviews
    , AVG(ratings.rating) as avg_rating
    , AVG(CASE
        WHEN reviews.id IS NULL THEN null
        ELSE ratings.rating
    END) as avg_review
    , MAX(date_rated) AS date_newest
FROM submissions.ratings
    LEFT JOIN submissions.reviews
        ON ratings.id = reviews.rating_id
        AND reviews.date_approved IS NOT NULL
WHERE ratings.provnum = $1::text
    AND ratings.filtered = false;
`;