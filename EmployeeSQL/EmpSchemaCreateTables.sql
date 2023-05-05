CREATE TABLE Titles(
title_id varchar(10) NOT NULL PRIMARY KEY,
title varchar(30) NOT NULL
);

CREATE TABLE Departments(
dept_no varchar(10) NOT NULL PRIMARY KEY,
dept_name varchar(30) NOT NULL
);

CREATE TABLE Employees(
emp_no INT NOT NULL PRIMARY KEY,
emp_title_id varchar(10) NOT NULL, 
birth_date date,
f_name varchar(30) NOT NULL,
l_name varchar(30) NOT NULL,
sex varchar(5),
hire_date date NOT NULL,
FOREIGN KEY (emp_title_id) references Titles(title_id)
);

CREATE TABLE Salaries(
emp_no INT NOT NULL, 
salary INT NOT NULL,
FOREIGN KEY (emp_no) references Employees(emp_no)
);

CREATE TABLE Dept_emp(
emp_no INT NOT NULL,
dept_no varchar(10) NOT NULL,
FOREIGN KEY (dept_no) references Departments(dept_no),
FOREIGN KEY (emp_no) references Employees(emp_no)
);

CREATE TABLE Dept_Mgr(
dept_no varchar(10) NOT NULL,
emp_no INT NOT NULL,
FOREIGN KEY (dept_no) references Departments(dept_no),
FOREIGN KEY (emp_no) references Employees(emp_no)
);