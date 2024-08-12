-- Ticket 2: Basic SELECT AND WHERE Clause
Use HealthcareSystemDB;
Select * FROM Patients WHERE Gender = 'Female'; 
Select Status FROM Appointments;
Select * FROM Doctors WHERE Specialization = 'Internal Medicine';
Select * FROM Patients WHERE DateOfBirth > '1985-01-01';
Select * FROM MedicalRecords WHERE Diagnosis LIKE '%Cold%';

-- Ticket 3: ORDER BY Clause
Select * FROM Patients Order By LastName;
Select * FROM Doctors Order By Specialization DESC;
Select * FROM Appointments Order By AppointmentDate DESC;
Select * FROM Departments Order By DepartmentName;
Select * FROM Billing Order By BalanceAmount DESC;

-- Ticket 4: GROUP BY AND HAVING Clauses
Select country,count(*) FROM Patients Group By Country;
Select DoctorID , Count(*) FROM Appointments Group By DoctorID;
Select PatientID,sum(TotalAmount) FROM Billing Group By PatientID;
Select DoctorID , Count(*) As TotalAppointments FROM Appointments Group By DoctorID HAVING TotalAppointments > 1;

-- Ticket 5: LIKE Operator
Select * FROM Patients WHERE FirstName LIKE 'J%';
Select * FROM Doctors WHERE LastName LIKE '%son';
Select * FROM Departments WHERE DepartmentName LIKE '%y';
Select * FROM MedicalRecords WHERE Diagnosis LIKE 'Hypertension';
Select * FROM patients WHERE Email LIKE '%example.com';

-- Ticket 6: BETWEEN Operator
Select * FROM Appointments WHERE AppointmentDate Between '2023-07-01' AND '2023-07-03';
Select * FROM Patients WHERE DateOfBirth Between '1980-01-01' AND '1990-12-31';
Select * FROM Billing WHERE TotalAmount Between '100' AND '500';
Select * FROM Appointments WHERE AppointmentDate Between  '2023-07-01' AND  '2023-07-08';

-- Ticket 7: LIMIT Operator
Select * FROM Patients Order By LastName LIMIT 5;
Select * FROM Billing Order By TotalAmount DESC LIMIT 3;
Select * FROM Appointments Order By AppointmentDate LIMIT 10;
Select * FROM Doctors Order By FirstName LIMIT 5;
Select * FROM Billing Order By BalanceAmount DESC LIMIT 5;

-- Ticket 8: Chaining SQL Clauses
Select * FROM Patients WHERE Gender = 'Female' AND Country = 'USA' Order BY LastName LIMIT 3;
Select DoctorID, Count(*) As TotalAppointments FROM Appointments group By DoctorID HAVING
TotalAppointments > 2 Order By TotalAppointments DESC;
Select * FROM Patients WHERE LastName LIKE 'S%' AND year(DateOfBirth)>1985 Order By DateofBirth ;
Select PatientID, count(*)  As numOfAppointmnets, sum(TotalAmount) AS finalAmounts  FROM Billing   Group BY PatientID 
HAVING numOfAppointmnets > 2 AND finalAmounts Between 200 AND 1500;

