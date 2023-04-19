--Create tables by inspecting csv files


Create table titles(
   					title_id Varchar(5) primary key,
					title Varchar(30) not null);
					


Create table departments(
						dept_no varchar(5) primary key,
						dept_name varchar(30) not null);



Create table employees(
					emp_no int(10) primary key,
					emp_title_id varchar(10) not null,
					birth_date date,
					first_name varchar(30) not null,
					last_name varchar(30) not null,
					sex varchar(1) not null,
					hire_date date,
					foreign key(emp_title_id) references titles(title_id)
					);
					
		


Create table dept_emp(
					emp_no int(5) not null,
					dept_no varchar(30) not null,
					primary key(emp_no, dept_no),
                    foreign key (emp_no) references employees(emp_no),
					foreign key (dept_no) references departments(dept_no)
					);
					




Create table salaries (
					emp_no int(6) primary key,
					salary int(10) not null,
					foreign key(emp_no) references employees(emp_no)
					);
					

Create table dept_manager(
						dept_no varchar(10) not null,
						emp_no int(6) not null,
						primary key(dept_no,emp_no),
						foreign key (dept_no) references departments (dept_no),
						foreign key (emp_no) references employees (emp_no)
						);

select * from titles;