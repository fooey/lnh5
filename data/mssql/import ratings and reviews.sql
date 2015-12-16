

-- ----------------------------------------
-- 
-- 	LOAD RAW DATA
-- 
-- ----------------------------------------

DROP TABLE IF EXISTS import.raw_ratings;

CREATE TABLE import.raw_ratings (
	id int
	, provnum text
	, ipaddress inet
	, rating int
	, review text
	, date_rated timestamp
	, review_approved timestamp
	, filtered boolean
	, write_duration int
) WITH (OIDS = FALSE);


COPY import.raw_ratings
FROM 'D:\inet\projects\lnh5\data\mssql\ratings.csv'
WITH
	CSV
	HEADER
	ENCODING 'windows-1251';DROP TABLE IF EXISTS submissions.ratings;





-- ----------------------------------------
-- 
--  	PUSH TO submission TABLES
-- 
-- ----------------------------------------
CREATE SCHEMA IF NOT EXISTS submissions;


CREATE TABLE submissions.ratings(
	id serial
	, provnum text
	, ipaddress inet
	, rating int
	, date_rated timestamp
	, filtered boolean
);

INSERT INTO submissions.ratings (
	id
	, provnum
	, ipaddress
	, rating
	, date_rated
	, filtered
)
SELECT
	id
	, provnum
	, ipaddress
	, rating
	, date_rated
	, filtered
FROM import.raw_ratings
ORDER BY id;

CREATE INDEX idx_submissions__ratings__provnum ON submissions.ratings (provnum, filtered);




DROP TABLE IF EXISTS submissions.reviews;

CREATE TABLE submissions.reviews(
	id serial
	, rating_id int
	, duration int
	, date_approved timestamp
	, content text
);



INSERT INTO submissions.reviews (
	rating_id
	, duration
	, date_approved
	, content
)
SELECT
	id as rating_id
	, write_duration
	, review_approved
	, review
FROM import.raw_ratings
WHERE review IS NOT NULL
ORDER BY id;


CREATE INDEX idx_submissions__reviews__rating_id ON submissions.reviews (rating_id);
CREATE INDEX idx_submissions__reviews__approved ON submissions.reviews (date_approved);


