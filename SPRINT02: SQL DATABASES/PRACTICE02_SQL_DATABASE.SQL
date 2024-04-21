CREATE TABLE EmployeeDemographcs
(EmployeeId int,
FirstName varchar(50),
Lastname varchar(50),
Age int,
Gender varchar(50)
);

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
);


INSERT INTO EmployeeDemographics VALUES
(1001, 'Mongkol', 'Muhammadaree', 50, 'Male'),
(1002, 'Ainee', 'Muhammadaree', 51, 'Female'),
(1003, 'Atikhom', 'Muhammadaree', 23, 'Male'),
(1004, 'Jasmine' , 'Muhammadaree', 19, 'Female'),
(1005, 'Jim', 'Halpert', 30, 'Male'),
(1006, 'Pam', 'Beasley', 30, 'Female'),
(1007, 'Dwight', 'Schrute', 29, 'Male'),
(1008, 'Angela', 'Martin', 31, 'Female'),
(1009, 'Kevin', 'Malone', 31, 'Male');


INSERT INTO EmployeeSalary VALUES
(1001, 'Technician', 15000), 
(1002, 'Housewife', 10000),
(1003, 'Data Analyst', 2000), 
(1004, 'Student', 5000),
(1005, 'Receptionist', 36000),
(1006, 'Salesman', 63000),
(1007, 'Accountant', 47000),
(1008, 'HR', 50000), 
(1009, 'Regional Manager', 65000);
