SELECT
	id
	, [uid] as provnum
	, dbo.convertIpFromInt(ipAddress) as ipAddress
	, rating
	, '"' + REPLACE(review, '"', '""') + '"' AS review
	, dateRated
	, reviewApproved
	, CAST(filtered as int) as filtered
	, writeDuration as writeDuration 
FROM [Logging].[dbo].[Ratings]
WHERE siteId = 1
ORDER BY id;