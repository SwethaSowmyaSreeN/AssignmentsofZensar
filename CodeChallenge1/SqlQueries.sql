create database EmployeeManagement
use EmployeeManagement
--table creation of EmployeeManagement
create table Code_Employee
(empno int primary key,
empname varchar(50) not null,
empsal numeric(10,2) check(empsal>=25000),
emptype varchar(1) check(emptype in('C','P')))
--inserting values to table employee
insert into Code_Employee values(501,'Swetha',26000,'C')
select *from Code_Employee
--stored procedure
create or alter procedure AddNewEmployee @ename varchar(50), @esal numeric(10,2), @etype varchar(1)
as
begin
declare @eid int = (select max(empno) from Code_Employee)
begin
declare @empid1 int = @eid + 1;
insert into Code_Employee values(@empid1, @ename, @esal, @etype)
end
end