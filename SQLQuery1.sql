create database citi
use citi
declare @name nvarchar(10)
set @name = 'hem'
print datalength(@name)
create table department ( deptid int not null constraint department_deptid_pk primary key,deptname varchar(20) not null constraint department_deptname_unq unique)

create table employee(
empid int identity(101,1) not null constraint employee_empid_pk primary key ,
empname varchar(20) not null,
desig varchar(20) null constraint employee_desig_chk check(desig in ('president','manager','executive')),
hiredate datetime default getdate(),
mgr int null constraint employee_mgr_sk references employee(empid),
salary numeric(10,2) null constraint employee_salary_chk check(salary >= 10000),
deptid int null constraint employee_deptid_fk references department (deptid)
)

select * from department

insert into department values(10,'sales')

select * from employee

insert into employee values('bhavana','president','01/08/2018',null,50000,10)

insert into employee(empid,empname,salary) values(3,'vishal',20000)
 update employee set deptid='20',desig = 'executive' where empid=3
delete from employee where empid=3

alter table employee add gender char(1) NULL

alter table employee drop column gender
drop table employee
drop table department

create table project(
projectid varchar(10) constraint project_projectid_pk primary key,
projname varchar(20) constraint project_projname_unq unique
)

select * from employee

insert into project values('p102','cititraining2')
delete from project where projectid='compliance'
drop table projemp_detail
create table projemp_detail(
projid varchar(10) not null constraint prdetail_projid_fk references project(projectid),
empid int not null constraint prdetail_empid_fk references employee (empid),
noofhours int null,
constraint prdetail_projid_empid_pk primary key (projid , empid ) 

)

select * from projemp_detail

