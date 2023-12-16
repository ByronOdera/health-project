SELECT *
	FROM HealthProject..diabetic_data

ALTER TABLE HealthProject..diabetic_data
DROP COLUMN weight,payer_code

SELECT * 
FROM HealthProject..diabetic_data

--SELECT ROUND(time_in_hospital,1) AS BUCKET,
--	COUNT(*) AS Count,
--	REPLICATE('', Count/100,'*') AS BAR
--FROM HealthProject..diabetic_data
--	GROUP BY BUCKET
--	ORDER BY BUCKET

SELECT DISTINCT(medical_specialty), ROUND(AVG(CONVERT(FLOAT,num_procedures)),1) AS avg_procedures
FROM HealthProject..diabetic_data
	GROUP BY medical_specialty
	ORDER BY avg_procedures DESC

SELECT DISTINCT(medical_specialty), ROUND(AVG(CONVERT(FLOAT,num_procedures)),1) AS avg_procedures,
COUNT(*) AS total_count
FROM HealthProject..diabetic_data
	GROUP BY medical_specialty
	ORDER BY avg_procedures DESC

SELECT num_lab_procedures,
CASE
	WHEN num_lab_procedures >= 0 AND num_lab_procedures < 25 THEN 'FEW'
	WHEN num_lab_procedures >= 25 AND num_lab_procedures < 55 THEN 'AVERAGE'
	ELSE 'MANY'
	END AS procedure_frequency
FROM HealthProject..diabetic_data


SELECT AVG(CONVERT(FLOAT,time_in_hospital)) AS avg_time,
CASE
	WHEN num_lab_procedures >= 0 AND num_lab_procedures < 25 THEN 'FEW'
	WHEN num_lab_procedures >= 25 AND num_lab_procedures < 55 THEN 'AVERAGE'
	ELSE 'MANY'
	END AS procedure_frequency
FROM HealthProject..diabetic_data
GROUP BY num_lab_procedures
ORDER BY avg_time DESC


SELECT race,gender,COUNT(race) AS pop
FROM HealthProject..diabetic_data
GROUP BY race,gender
ORDER BY race ASC

UPDATE HealthProject..diabetic_data
SET race = 'Mixed'
WHERE race = '?'

SELECT *
FROM HealthProject..diabetic_data