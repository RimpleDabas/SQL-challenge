--Drop the tables if exists,use cascade to avoid error beacause of dependency between the tables

DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;

CREATE TABLE titles(
    title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
    PRIMARY KEY(title_id)
);

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY(dept_no)
);

CREATE TABLE employees (
     emp_no INT NOT NULL,
   	 emp_title_id VARCHAR NOT NULL,
     birth_date DATE NOT NULL,
   	 first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
   	 sex VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no),
	 CONSTRAINT fk_employees_title_id
	 FOREIGN KEY (emp_title_id)
	 REFERENCES titles (title_id)
);
CREATE TABLE dept_emp(
     emp_no INT NOT NULL,
     dept_no VARCHAR NOT NULL,
	 PRIMARY KEY (emp_no, dept_no),
	 CONSTRAINT fk_dept_emp_emp_no
	 FOREIGN KEY (emp_no)
	 REFERENCES employees(emp_no),
	 CONSTRAINT fk_dept_emp_dept_no
	 FOREIGN KEY (dept_no)
	 REFERENCES departments(dept_no)
);


CREATE TABLE salaries (
	 emp_no INT NOT NULL,
	 salary INT NOT NULL,
	 PRIMARY KEY (emp_no),
	 CONSTRAINT fk_salaries_emp_no
	 FOREIGN KEY (emp_no)
	 REFERENCES employees(emp_no)
);

					

CREATE TABLE dept_manager(
		dept_no VARCHAR NOT NULL,
		emp_no INT NOT NULL,
		PRIMARY KEY (dept_no,emp_no),
		CONSTRAINT fk_dept_manager_emp_no
	    FOREIGN KEY (emp_no)
	    REFERENCES employees(emp_no),
	    CONSTRAINT fk_dept_manager_dept_no
	    FOREIGN KEY (dept_no)
	 	REFERENCES departments(dept_no)
);
