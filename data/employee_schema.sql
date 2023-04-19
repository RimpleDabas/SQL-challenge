--Create tables by inspecting csv files


Create table titles(
   					title_id Varchar primary key,
					title Varchar not null);
					


Create table departments(
						dept_no varchar primary key,
						dept_name varchar);



Create table employees(
					emp_no int primary key,
					emp_title_id varchar not null,
					birth_date varchar not null,
					first_name varchar not null,
					last_name varchar not null,
					sex varchar not null,
					hire_date varchar not null,
					foreign key(emp_title_id) references titles(title_id)
					);
					
		


Create table dept_emp(
					emp_no int not null,
					dept_no varchar not null,
					primary key(emp_no, dept_no),
                    foreign key (emp_no) references employees(emp_no),
					foreign key (dept_no) references departments(dept_no)
					);
					




Create table salaries (
					emp_no int primary key,
					salary int not null,
					foreign key(emp_no) references employees(emp_no)
					);
					

Create table dept_manager(
						dept_no varchar not null,
						emp_no int not null,
						primary key(dept_no,emp_no),
						foreign key (dept_no) references departments (dept_no),
						foreign key (emp_no) references employees (emp_no)
						);

select * from titles;