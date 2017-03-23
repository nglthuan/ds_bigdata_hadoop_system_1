DROP TABLE numericDates;
CREATE TABLE numericDates AS
SELECT
CAST(
   CONCAT(substr(measure_start_date, 7, 4),
	  '-',
	  substr(measure_start_date, 1, 2),
	  '-',
	  substr(measure_start_date, 4, 2)
	 )
   AS date) AS numeric_date,
   measure_start_date
FROM measures
;
