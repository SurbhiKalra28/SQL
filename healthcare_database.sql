-- Ticket 2: Basic SELECT and WHERE Clause
Use HealthcareSystemDB;
Select * from Patients where Gender = 'Female'; 
Select Status from Appointments;
Select * from Doctors where Specialization = 'Internal Medicine';
Select * from Patients where DateOfBirth > '1985-01-01';
Select * from MedicalRecords where Diagnosis like '%Cold%';

-- Ticket 3: ORDER BY Clause
Select * from Patients Order By LastName;
Select * from Doctors Order By Specialization desc;
Select * from Appointments Order By AppointmentDate desc;
Select * from Departments Order By DepartmentName;
Select * from Billing Order By BalanceAmount desc;

-- Ticket 4: GROUP BY and HAVING Clauses
Select country,count(*) from Patients Group By Country;
Select DoctorID , Count(*) from Appointments Group By DoctorID;
Select PatientID,sum(TotalAmount) from Billing Group By PatientID;
Select DoctorID , Count(*) As TotalAppointments from Appointments Group By DoctorID having TotalAppointments > 1;

-- Ticket 5: LIKE Operator
Select * from Patients where FirstName Like 'J%';
Select * from Doctors where LastName Like '%son';
Select * from Departments where DepartmentName Like '%y';
Select * from MedicalRecords where Diagnosis like 'Hypertension';
Select * from patients where Email like '%example.com';

-- Ticket 6: BETWEEN Operator
Select * from Appointments where AppointmentDate Between '2023-07-01' And '2023-07-03';
Select * from Patients where DateOfBirth Between '1980-01-01' and '1990-12-31';
Select * from Billing where TotalAmount Between '100' and '500';
Select * from Appointments where AppointmentDate Between  '2023-07-01' And  '2023-07-08';

-- Ticket 7: LIMIT Operator
Select * from Patients Order By LastName LIMIT 5;
Select * from Billing Order By TotalAmount desc LIMIT 3;
Select * from Appointments Order By AppointmentDate LIMIT 10;
Select * from Doctors Order By FirstName LIMIT 5;
Select * from Billing Order By BalanceAmount desc LIMIT 5;

-- Ticket 8: Chaining SQL Clauses
Select * from Patients where Gender = 'Female' And Country = 'USA' Order BY LastName LIMIT 3;
Select DoctorID, Count(*) As TotalAppointments from Appointments group By DoctorID having
TotalAppointments > 2 Order By TotalAppointments desc;
Select * from Patients Where LastName like 'S%' And year(DateOfBirth)>1985 Order By DateofBirth ;
Select PatientID, count(*)  As numOfAppointmnets, sum(TotalAmount) AS finalAmounts  from Billing   Group BY PatientID 
having numOfAppointmnets > 2 and finalAmounts Between 200 And 1500;

