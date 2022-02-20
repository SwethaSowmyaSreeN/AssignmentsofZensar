-------------------------------Assignment 3-----------------------------------
/*
1.	Write a T-SQL Program to generate complete payslip of a given employee with respect to the following condition
a)	HRA  as 10% Of sal
b)	DA as  20% of sal
c)	PF as 8% of sal
d)	IT as 5% of sal
e)	Deductions as sum of PF and IT
f)	Gross Salary as sum of SAL,HRA,DA and Deductions
g)	Net salary as  Gross salary- Deduction
*/
begin
declare @salary float=45000
declare @SAL float
declare @HRA float,@DA float,@PF float,@IT float
declare @deductions float,@GrossSal float,@NetSal float
set @HRA=@salary*0.1
print 'HRA is:'
print @HRA 
set @DA=@salary*0.2
print 'DA is:'
print @DA
set @PF=@salary*0.08
print 'PF is:'
print @PF
set @IT=@salary*0.05
print 'IT is:'
print @IT
set @deductions=@PF+@IT
print 'Deductions is:'
print @deductions
set @SAL=@salary-(@HRA+@DA+@deductions)
set @GrossSal=@SAL+(@HRA+@DA+@deductions)
print 'Gross salary is'
print @GrossSal
set @NetSal=@GrossSal-@deductions
print 'Net Salary is'
print @NetSal
end
------------------------------------------------------------------------------------------------------
/*
2. Write a T-SQL Program to Display complete result of a given student. 
   (Note: Consider 10th standard result sheet and Student table structure as (sno,sname,maths,phy,comp)
*/

begin
declare @SNo int,@SName varchar(20),@Maths int,@Physics int,@Computer int,@Total int,@Percentage float
declare @Result varchar(20)
set @SNo=1
set @SName='Swetha'
set @Maths=89
set @Physics=76
set @Computer=98
set @Total=(@Maths+@Physics+@Computer)
print  @Total
set @Percentage=(@Total*100)/300
print @Percentage 
create table Result(
Sno int,Sname varchar(20),Mat int,Phy int,Comp int,Tot int,Per float)
insert into Result
values(@SNo,@SName,@Maths,@Physics,@Computer,@Total,@Percentage)
select *from Result
end
drop table Result

-----------------------------------------------------------------------------------------------------------------
--3. Write a T-SQL Program to find the factorial of a given number.

begin 
declare @num int
declare @fact int
set @num=4
set @fact=1
while @num>0
 begin
   set @fact=@fact*@num
   set @num=@num-1  
  end
  print 'Factorial of given number is'
  print @fact
end
-----------------------------------------------------------------------------------------------------------------
--4. Create a stored procedure to generate multiplication tables up to a given number.
create or alter procedure Multiplication
as
begin 
declare @i int=1,@num int=6,@n int
while @i<=10
begin
set @n=@num*@i
print @n
set @i=@i+1
end
end
-----execute the above procedure---
exec Multiplication
--------------------------------------------------------------------------------------------------------------
/*
5.Create a user defined function calculate Bonus for all employees of a  given job using following conditions
a.For Deptno10 employees 15% of sal as bonus.
b.For Deptno20 employees  20% of sal as bonus
c.For Others employees 5%of sal as bonus
*/
use sqlAssignment1
select *from EMP
create or alter function CalculateBonus(@empjob varchar(10))
returns table
as
return (select Job,Sal,Empname,DeptId from EMP where job=@empjob)
go
update EMP set Sal=Sal+(Sal*0.15) where DeptId=10
update EMP set Sal=Sal+(Sal*0.2) where DeptId=20
update EMP set Sal=Sal+(Sal*0.05) where DeptId<>10 and DeptId<>20
---execution
select *from CalculateBonus('CLERK')
--------------------------------------------------------------------------------------------------------------
/*
6. Create a trigger to restrict data manipulation on EMP table during General holidays.
   Display the error message like “Due to Independence day you cannot manipulate data”
   Note: Create holiday table as (holiday_date,Holiday_name) store at least 4 holiday details
*/
create database newZensarDB
use newZensarDB

create table Holiday
(Holiday_date varchar(20),
Holiday_Name varchar(20))

insert into Holiday values
('26-JAN','Republic Day'),
('15-AUG','Independence Day'),
('5-SEP','Teachers Day'),
('25-DEC','Christmas'),
('2-OCT','Gandhi Jayanthi')

select *from Holiday

create or alter trigger RestrictDataManipulation
on Holiday
instead of update
as
  Raiserror('Due to Public Holiday you cannot manipulate data',16,1)
----execution to check whether it is triggering or not
  update Holiday set Holiday_date='21-Jan' where Holiday_date='26-JAN'


