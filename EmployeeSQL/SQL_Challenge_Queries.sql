-- Question 1 list the following details of each employee: employee number, Last name,
-- firstname, sex, and salary
select *
from employee;

select employee.emp_no, first_name, last_name, sex, salary
from employee
join salaries on employee.emp_no = salaries.emp_no;


--Question 2 list first name, last name and hire date for employees who were hired in 1996

select first_name, last_name, hire_date
from employee
where hire_date between '1996-01-01' and '1996-12-31';


--Question 3 List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
--join dept_manager & depatments first then employee

Select departments.dept_no, dept_manager.emp_no, dept_name,last_name, first_name
From departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employee on dept_manager.emp_no = employee.emp_no;


--Question 4 List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--link departments to dept_emp before linking employee

Select dept_emp.emp_no, dept_name, last_name, first_name 
From departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employee on employee.emp_no = dept_emp.emp_no;


-- Question 5 List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
From employee
Where first_name ='Hercules' and last_name like 'B%';



-- Question 6  List all employees in the Sales department, including
--their employee number, last name, first name, and department name.
--select * from departments;
Select employee.emp_no, last_name, first_name, departments.dept_name
From departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employee on employee.emp_no = dept_emp.emp_no
where departments.dept_name = 'Sales';


--Question 7 List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
-- use or so you don't exclude a person who is not in the both departments
Select employee.emp_no, last_name, first_name, departments.dept_name
From departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employee on employee.emp_no = dept_emp.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';



--Question 8 In descending order 
-- list the frequency count of employee last names, i.e., how many employees share each last name.
-- use count as the functio
Select last_name,count(last_name)
From employee
Group By last_name
Order BY  count(last_name) DESC;

--end of assignment
--