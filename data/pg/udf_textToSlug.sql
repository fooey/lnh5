
CREATE OR REPLACE FUNCTION public.udf_textToSlug(input text) RETURNS text AS $$ 
DECLARE result TEXT;
BEGIN
	result := lower(input);
	result := regexp_replace(result, '[^a-z0-9 ]', ' ', 'gi');
	result := trim(result);
	result := regexp_replace(result, '[ ]{1,}', '-', 'gi');

	RETURN result;
END; 
$$ LANGUAGE PLPGSQL IMMUTABLE LEAKPROOF;


/*

	SELECT public.udf_textToSlug('test TEST test');

*/