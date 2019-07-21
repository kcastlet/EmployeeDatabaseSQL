-- Database: public

-- DROP DATABASE public;

/*CREATE DATABASE public
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;*/
	
DROP TABLE IF EXISTS employees, dept_emp, departments, dept_manager, salaries, titles;

CREATE TABLE "departments" (
    "dept_no" int NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int NOT NULL PRIMARY KEY,
    "birth_date" VARCHAR NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "gender" VARCHAR NOT NULL,
    "hire_date" VARCHAR NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" int NOT NULL,
    "from_date" VARCHAR NOT NULL PRIMARY KEY,
    "to_date" VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" int NOT NULL,
    "emp_no" int NOT NULL,
    "from_date" VARCHAR NOT NULL PRIMARY KEY,
    "to_date" VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" VARCHAR NOT NULL PRIMARY KEY,
    "from_date" VARCHAR NOT NULL,
    "to_date" VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE "titles" (
    "emp_no" int NOT NULL, 
    "title" VARCHAR NOT NULL PRIMARY KEY,
    "from_date" VARCHAR NOT NULL,
    "to_date" VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
