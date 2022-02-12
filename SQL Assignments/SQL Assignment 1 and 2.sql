create database sqlAssignment1
use sqlAssignment1
-----creating table employee
create table EMP
(Empno int primary key,
 Empname varchar(30),
 Job varchar(20),
 MGR int,
 HireDate varchar(20),
 Sal float,
 COMM int,
 DeptId int foreign key references Dept(DeptNo))
 
select *from EMP
--------inserting values to emp table
insert into EMP
values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,null,20),
(7499,'ALLEN','SALESMAN',7698,'20-FEB-81', 1600,300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '22-FEB-81', 1250,500, 30),
(7566, 'JONES', 'MANAGER', 7839, '02-APR-81', 2975,null, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-81', 1250,1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '01-MAY-81', 2850,null, 30),
(7782, 'CLARK', 'MANAGER', 7839, '09-JUN-81', 2450,null, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '19-APR-87', 3000,null, 20),
(7839, 'KING', 'PRESIDENT', null, '17-NOV-81', 5000,null, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '08-SEP-81', 1500,0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '23-MAY-87',1100,null, 20),
(7900, 'JAMES', 'CLERK', 7698, '03-DEC-81', 950,null, 30),
(7902, 'FORD', 'ANALYST', 7566, '03-DEC-81', 3000,null, 20),
(7934, 'MILLER', 'CLERK', 7782, '23-JAN-82', 1300,null, 10)

select *from EMP
-----creating table department
create table Dept(DeptNo int primary key,
DName varchar(20),
Loc varchar(20))
select *from Dept
----inserting values to department table
insert into Dept
values(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','Boston')
----------------------------=====================Assignment 1======================----------------------------------

--1. List all employees whose name begins with 'A'.
select *from emp where Empname like 'A%'

--2. Select all those employees who don't have a manager. 
select *from Emp where MGR is null

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select Empname,Empno,Sal from emp where sal between 1200 and 1400

--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
select DeptId,Empname,Sal ,(Sal+(Sal*10/100)) 'New Sal' from Emp where DeptId=20

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select count(Job) 'No.Of.Clerks' from Emp where Job='Clerk'

--6. Find the average salary for each job type and the number of people employed in each job. 
select Job,count(*) 'Count Of Emp',avg(sal) 'Sal Avg' from Emp group by(Job)

--7. List the employees with the lowest and highest salary. 
select Empname,Sal from Emp
where Sal=(select(min(sal) )from emp)
select Empname,Sal from Emp
where Sal=(select(max(sal) )from emp)

--8. List full details of departments that don't have any employees. 
select *from dept where deptno not in (select DeptId from Emp)

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select EmpName, sal from EMP
where Job = 'ANALYST' and sal > 1200 and DeptId= 20
order by EmpName

--10. For each department, list its name and number together with the total salary paid to employees in that department. 
select dname,count(*)deptno,sum(sal) 'Total Sal' from dept,emp 
where dept.deptno=emp.deptid
group by dname


--11. Find out salary of both MILLER and SMITH.
select Empname,Sal from Emp where Empname='Miller' or Empname='Smith'

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’.
select Empname from Emp where Empname like 'A%' or Empname like 'M%'

--13. Compute yearly salary of SMITH. 
select empname,Sal,(Sal*12) 'Annual Sal' from Emp where Empname='Smith'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select Empname,Sal from Emp where Sal not between 1500 and 2850
--------------------------========================Assignment 2===============================------------------------------------

--15. Retrieve a list of MANAGERS.
select *from emp where Job='Manager'

--16. Find out salary of both MILLER and SMITH.
select empname,Sal from emp where empname ='Miller' or empname= 'Smith'

--17. Find out the names and salaries of all employees earning more than 1000 per month.
select empname,sal from emp where sal>1000 

--18. Display the names and salaries of all employees except JAMES. 
select empname,sal from emp where empname!='james'

--19. Find out the details of employees whose names begin with ‘S’. 
select *from emp where empname like 'S%'

--20. Find out the names of all employees that have ‘A’ anywhere in their name. 
select *from emp where empname like '%A%'

--21. Find out the names of all employees that have ‘L’ as their third character in their name.
select empname from emp where empname like '__L%'

--21. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
select empname from emp where empname like 'A%' or empname like 'M%'

--22. Compute yearly salary of SMITH.
select empname,sal,(sal*12) 'Annual Sal' from emp where empname='Smith'

--23. Compute daily salary of JONES.
select sal,(sal/30) 'Per Day Sal' from emp where empname='Jones'

--24. Calculate the total monthly salary of all employees.
select sum(sal) 'Total Sal of Employees' from emp

--25. Print the average annual salary. 
select avg(sal*12) 'Avg_Salaries_of_Emp' from emp

--26. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select empname,job,sal,deptid from emp where job!='Salesman' and deptid=30

--27. List unique departments of the EMP table. 
select distinct(deptid) from emp

--28. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select empname 'Employee',sal 'Monthly Salary' from emp where sal>1500 and (deptid=10 or deptid=30 )