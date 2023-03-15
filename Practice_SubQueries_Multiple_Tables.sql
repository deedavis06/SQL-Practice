--From IBM Db2 sample HR database---

--Practice Questions: SubQueries-
----Execute a failing query to retrieve all employees records whose salary is lower than the average salary.--
SELECT * FROM employees WHERE salary < AVG(salary);

--Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.--
SELECT emp_id, salary FROM employees WHERE salary < (SELECT AVG(salary) FROM employees);

--Execute a failing query to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.--
SELECT emp_id, salary, max(salary) AS max_salary FROM employees;

--Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.--
SELECT emp_id, salary, (SELECT MAX(salary) FROM employees) AS max_salary FROM employees;

--Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).--
SELECT * FROM (SELECT emp_id, f_name, l_name, dep_id FROM employees) AS non_employ_data;

--Practice Questions: Multiple Tables--
--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.--
SELECT * FROM employees 
WHERE job_id IN (SELECT job_ident FROM jobs);

--Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.--
SELECT * FROM employees WHERE job_id IN 
(SELECT job_ident FROM jobs WHERE job_title='Jr. Designer');

--Retrieve JOB information and who earned more than $70,000.--
SELECT job_title, job_ident, min_salary, max_salary FROM jobs 
WHERE job_ident IN (SELECT job_id FROM employees WHERE salary > 70000);

--Retrieve JOB information and whose birth year is after 1976.--
SELECT * FROM jobs WHERE job_ident IN (SELECT job_id FROM employees WHERE YEAR(b_date) > 1976);

--Retrieve JOB information for female employees whose birth year is after 1976.--
SELECT * FROM jobs WHERE job_ident IN 
(SELECT job_id FROM employees WHERE YEAR(b_date) > 1976 AND sex='F');

--Perform an implicit (cartesian/cross) join between EMPLOYEES and JOBS tables.--
SELECT * FROM employees, jobs;

--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.--
SELECT * FROM employees E, jobs J WHERE E.job_id=J.job_ident;

--Retrieve only the Employee ID, Employee Name and Job Title.--
SELECT E.emp_id, E.f_name, E.l_name, J.job_title 
FROM employees E, jobs J WHERE E.job_id=J.job_ident;