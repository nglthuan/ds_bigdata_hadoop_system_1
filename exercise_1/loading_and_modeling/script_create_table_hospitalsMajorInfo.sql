DROP TABLE hospitalsMajorInfo;
CREATE TABLE hospitalsMajorInfo AS
SELECT
   provider_id,
   hospital_name,
   state,
   cast(hospital_overall_rating as decimal(1, 0)) rating
FROM hospitals
WHERE hospital_overall_rating not like 'Not%'
;

