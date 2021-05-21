CREATE TABLE departments (
dept_no VARCHAR,
dept_name VARCHAR
);

CREATE TABLE dept_emps (
emp_no varchar,
dept_no VARCHAR
);

CREATE TABLE dept_manager (
dept_no VARCHAR,
emp_no varchar
);

CREATE TABLE employees (
emp_no varchar,
emp_title_id varchar,
birth_date varchar,
first_name varchar,
last_name varchar,
sex varchar,
hire_date date
);

CREATE TABLE salaries (
emp_no varchar,
salary int
);

CREATE TABLE titles (
title_id VARCHAR,
title VARCHAR
);



-- Data Analysis 1: 
-- List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on employees.emp_no=salaries.emp_no;

--Data Analysis 2:
--List first name, last name, and hire date for employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_date
from employees
where hire_date >= '1/1/1986' and hire_date <= '12/31/1986';

--Data Analysis 3:
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
create table manager_info as
select dept_manager.emp_no, dept_manager.dept_no, departments.dept_name
from dept_manager
inner join departments on dept_manager.dept_no=departments.dept_no;

select manager_info.dept_no, manager_info.dept_name, manager_info.emp_no, employees.last_name, employees.first_name
from manager_info
inner join employees on employees.emp_no=manager_info.emp_no;

--Data Analysis 4:
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
create table employee_info as
select departments.dept_name, dept_emps.emp_no, dept_emps.dept_no 
from dept_emps
inner join departments on dept_emps.dept_no=departments.dept_no;

select distinct employee_info.emp_no, employees.last_name, employees.first_name, employee_info.dept_name
from employee_info
left join employees on employee_info.emp_no=employees.emp_no;

--Data Analysis 5:
--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name LIKE 'Hercules' and last_name LIKE 'B%';

--Data Analysis 6:
--List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
select distinct employee_info.emp_no, employees.last_name, employees.first_name, employee_info.dept_name
from employee_info
inner join employees on employees.emp_no=employee_info.emp_no
where dept_name = 'Sales';

--Data Analysis 7:
--List all employees in the Sales and Development departments, including
--their employee number, last name, first name, and department name.
select distinct employee_info.emp_no, employees.last_name, employees.first_name, employee_info.dept_name
from employee_info
inner join employees on employees.emp_no=employee_info.emp_no
where dept_name = 'Sales' or dept_name = 'Development';

--Data Analysis 8:
--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
select last_name, 
	count(last_name) as count
from employees
group by last_name
order by count desc












