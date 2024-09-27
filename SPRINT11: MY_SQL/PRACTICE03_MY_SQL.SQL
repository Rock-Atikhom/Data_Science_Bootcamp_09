-- 01
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]' OR CITY NOT REGEXP '[aeiouAEIOU]$';

-- 02
SELECT 
    DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]' AND CITY NOT REGEXP '[aeiouAEIOU]$';

-- 03
SELECT 
    NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME,3), ID;

-- 04
SELECT 
    NAME
FROM EMPLOYEE
ORDER BY NAME ASC;

-- 05 
SELECT 
    NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;

-- 06
SELECT
    CASE
        WHEN A+B <=C OR A+C <=B OR B+C <=A THEN 'Not A Triangle'
        WHEN A=B AND B=C THEN 'Equilateral'
        WHEN A=B OR B=C OR A=C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TRIANGLESSET
FROM TRIANGLES;

-- 07
SELECT
    last.employee_ID,
    employee.name
FROM employee_information AS employee
JOIN last_quarter_bonus AS last
ON employee.employee_ID = last.employee_ID
WHERE bonus >= 5000 AND division = 'HR';
