--List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

--QUERY TABLES
SELECT * FROM EMPLOYEES;

SELECT * FROM SALARIES;

--COMBINE TABLES TO GET NEEDED INFORMATION
SELECT 
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.SEX,
	SALARIES.SALARY
FROM EMPLOYEES
	LEFT JOIN SALARIES
	ON EMPLOYEES.EMP_NO=SALARIES.EMP_NO
ORDER BY EMPLOYEES.EMP_NO
;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1986-01-01' AND '1986-12-31'
;

--List the manager of each department with the following information: department number,
--department name, the manager's employee number, last name, first name.

SELECT * FROM DEPARTMENTS;

SELECT 
	DEPT_MANAGER.DEPT_NO,
	DEPARTMENTS.DEPT_NAME,
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME
FROM DEPT_MANAGER
	INNER JOIN DEPARTMENTS
		ON (DEPT_MANAGER.DEPT_NO=DEPARTMENTS.DEPT_NO)
	INNER JOIN EMPLOYEES
		ON (DEPT_MANAGER.EMP_NO=EMPLOYEES.EMP_NO)
;
	



--List the department of each employee with the following information: employee number,
--last name, first name, and department name.

SELECT 
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
	INNER JOIN DEPT_EMP
		ON (EMPLOYEES.EMP_NO=DEPT_EMP.EMP_NO)
	INNER JOIN DEPARTMENTS
		ON (DEPT_EMP.DEPT_NO=DEPARTMENTS.DEPT_NO)
ORDER BY EMPLOYEES.EMP_NO
;

-- List first name, last name, and sex for employees whose first name is "Hercules"
--and last names begin with "B."
SELECT FIRST_NAME, LAST_NAME, SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
AND LAST_NAME LIKE 'B%'
;

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT 
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
	INNER JOIN DEPT_EMP
		ON (EMPLOYEES.EMP_NO=DEPT_EMP.EMP_NO)
	INNER JOIN DEPARTMENTS
		ON (DEPT_EMP.DEPT_NO=DEPARTMENTS.DEPT_NO)
WHERE DEPARTMENTS.DEPT_NAME='Sales'
ORDER BY EMPLOYEES.EMP_NO
;


--List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

SELECT 
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
	INNER JOIN DEPT_EMP
		ON (EMPLOYEES.EMP_NO=DEPT_EMP.EMP_NO)
	INNER JOIN DEPARTMENTS
		ON (DEPT_EMP.DEPT_NO=DEPARTMENTS.DEPT_NO)
WHERE DEPARTMENTS.DEPT_NAME IN ('Sales', 'Development')
ORDER BY EMPLOYEES.EMP_NO
;


-- List the frequency count of employee last names 
SELECT LAST_NAME, COUNT(LAST_NAME)
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY COUNT(LAST_NAME) DESC;