-- Create department table and view column datatypes
CREATE TABLE Departments(
	Dept_No VARCHAR,
	Dept_Name VARCHAR,
	PRIMARY KEY (Dept_No)
);

SELECT * FROM Departments;

-- Create departmentemployees table and view column datatypes
CREATE TABLE DepartmentEmployees(
	Emp_No INT,
	Dept_No VARCHAR,
	From_Date DATE,
	To_Date DATE,
	FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No)
);

SELECT * FROM DepartmentEmployees;

-- Create employees table and view column datatypes
CREATE TABLE Employees(
	Emp_No INT,
	Birth_Date DATE NOT NULL,
	First_Name VARCHAR(30) NOT NULL,
	Last_Name VARCHAR (30) NOT NULL,
	Gender VARCHAR,
	Hire_Date DATE NOT NULL,
	PRIMARY KEY (Emp_No)
);

SELECT * FROM Employees;

-- Create departmentmanagers table and view column datatypes
CREATE TABLE DepartmentManagers(
	Dept_No VARCHAR,
	Emp_No INT,
	From_Date DATE,
	To_Date DATE,
	FOREIGN KEY (Dept_No) REFERENCES Departments(Dept_No),
	FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);

SELECT * FROM DepartmentManagers;

-- Create salary table and view column datatypes
CREATE TABLE Salary(
	Emp_No INT,
	Salary INT,
	From_Date DATE,
	To_Date DATE,
	FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);

SELECT * FROM Salary;

-- Create salary table and view column datatypes
CREATE TABLE Titles(
	Emp_No INT,
	Title VARCHAR,
	From_Date DATE,
	To_Date DATE,
	FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);

SELECT * FROM Titles;

