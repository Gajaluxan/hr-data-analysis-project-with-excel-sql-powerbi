SELECT * FROM hr;


-- Question:01
SELECT gender,COUNT(*) AS count 
FROM hr 
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY gender;


-- Question:02
SELECT race, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY count DESC;


-- Question:03
SELECT 
	min(age) AS youngest,
	max(age) AS oldest
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00';

SELECT
	CASE
		WHEN age >= 18 AND age <= 24 THEN '18 TO 24'
        WHEN age >= 25 AND age <= 34 THEN '25 TO 34'
        WHEN age >= 35 AND age <= 44 THEN '35 TO 44'
        WHEN age >= 45 AND age <= 54 THEN '45 TO 54'
        WHEN age >= 55 AND age <= 64 THEN '55 TO 64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

SELECT
	CASE
		WHEN age >= 18 AND age <= 24 THEN '18 TO 24'
        WHEN age >= 25 AND age <= 34 THEN '25 TO 34'
        WHEN age >= 35 AND age <= 44 THEN '35 TO 44'
        WHEN age >= 45 AND age <= 54 THEN '45 TO 54'
        WHEN age >= 55 AND age <= 64 THEN '55 TO 64'
        ELSE '65+'
    END AS age_group,
    gender,
    COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group,gender
ORDER BY age_group, gender;


-- Question:04
SELECT location, COUNT(*) AS emp_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location;


-- Question:05
SELECT 
	ROUND(AVG(DATEDIFF(termdate, hire_date))/365, 0) AS avg_length_employment
FROM hr
WHERE age >= 18 AND termdate <= CURDATE() AND termdate <> '0000-00-00';


-- Question:06
SELECT department, gender, COUNT(*) AS count
From hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY department, gender
ORDER BY department;


-- Question:07
SELECT jobtitle, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle DESC;


-- Question:08
SELECT department,
		total_count,
        terminated_count,
        terminated_count/total_count AS terminated_rate
FROM(
		SELECT department, 
			COUNT(*) AS total_count,
			SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminated_count
        FROM hr
        WHERE age >= 18
        GROUP BY department ) AS SUBQUEY
ORDER BY terminated_rate DESC;


-- Question:09
SELECT location_state, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location_state
ORDER BY count DESC;


-- Question:10
SELECT 
	year,
	hires,
    terminaions,
    (hires - terminaions) AS net_change,
    ROUND((hires - terminaions)/hires * 100, 2) AS net_change_percentage
FROM (
	SELECT	YEAR(hire_date) AS year, COUNT(*) AS hires,
			SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminaions
            FROM hr
			WHERE age >= 18
            GROUP BY YEAR(hire_date)
) AS SUBQUERY 
ORDER BY year ASC;


-- Question:11
SELECT department, ROUND(AVG(DATEDIFF(termdate, hire_date)/365), 0) AS avg_tenure
FROM hr 
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00' AND age >= 18
GROUP BY department;


