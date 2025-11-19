create database company;
use company;
create table Employee ( Employee_id int, First_name varchar(20), last_name varchar (20), address varchar(50), gender varchar(10),
job_id varchar(15), salary int, department_id varchar(15),
primary key (Employee_id));


create table Department ( department_id varchar(15), dept_name varchar(20), manager_name varchar(20), 
primary key (department_id));


create table jobs ( job_id varchar(15), job_title varchar(20), min_salary int, max_salary int,
primary key (job_id));

create table job_history( Employee_id int, start_date datetime, last_date datetime, job_id varchar(15), department_id varchar(15),
primary key (Employee_id));

alter table Employee modify Employee_id varchar(15);
alter table job_history modify Employee_id varchar(15);
alter table job_history modify start_date date;
alter table job_history modify last_date date;

INSERT INTO Employee (Employee_id, First_name, last_name, gender, address, job_id, salary, department_id) 
VALUES
('EMP000001', 'John', 'Doe', 'M', '123 Elm St, Springfield', 'JOB001', 60000.00, 'DEP001'),
('EMP000002', 'Jane', 'Smith', 'F', '456 Oak St, Springfield', 'JOB002', 85000.00, 'DEP002'),
('EMP000003', 'Alice', 'Johnson', 'F', '789 Pine St, Springfield', 'JOB003', 75000.00, 'DEP001'),
('EMP000004', 'Bob', 'Brown', 'M', '159 Maple St, Springfield', 'JOB004', 50000.00, 'DEP003'),
('EMP000005', 'Eve', 'Davis', 'F', '951 Cedar St, Springfield', 'JOB005', 90000.00, 'DEP002'),
('EMP000006', 'Charlie', 'Miller', 'M', '357 Birch St, Springfield', 'JOB006', 120000.00, 'DEP002'),
('EMP000007', 'David', 'Wilson', 'M', '753 Spruce St, Springfield', 'JOB007', 45000.00, 'DEP001'),
('EMP000008', 'Grace', 'Lee', 'F', '852 Aspen St, Springfield', 'JOB008', 65000.00, 'DEP003'),
('EMP000009', 'Hannah', 'Martin', 'F', '468 Redwood St, Springfield', 'JOB009', 70000.00, 'DEP001'),
('EMP000010', 'Jack', 'White', 'M', '123 Willow St, Springfield', 'JOB010', 80000.00, 'DEP002');

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
('JOB001', 'Manager', 50000.00, 80000.00),
('JOB002', 'Senior Developer', 70000.00, 120000.00),
('JOB003', 'Analyst', 50000.00, 75000.00),
('JOB004', 'Junior Developer', 40000.00, 60000.00),
('JOB005', 'Data Scientist', 80000.00, 140000.00),
('JOB006', 'CTO', 100000.00, 200000.00),
('JOB007', 'HR Specialist', 45000.00, 70000.00),
('JOB008', 'Marketing Manager', 60000.00, 100000.00),
('JOB009', 'Sales Executive', 55000.00, 90000.00),
('JOB010', 'IT Support', 35000.00, 50000.00);

INSERT INTO Department (department_id, dept_name, manager_name) VALUES
('DEP001', 'Sales', 'Alice Johnson'),
('DEP002', 'IT', 'Eve Davis'),
('DEP003', 'HR', 'Bob Brown'),
('DEP004', 'Finance', 'John Doe'),
('DEP005', 'Marketing', 'Jane Smith'),
('DEP006', 'Operations', 'David Wilson'),
('DEP007', 'R&D', 'Charlie Miller'),
('DEP008', 'Customer Service', 'Grace Lee'),
('DEP009', 'Legal', 'Hannah Martin'),
('DEP010', 'Procurement', 'Jack White');

INSERT INTO job_history (Employee_id, start_date, last_date, job_id, department_id) VALUES
('EMP000001', '2015-06-01', '2020-12-31', 'JOB001', 'DEP001'),
('EMP000002', '2017-03-15', '2022-11-30', 'JOB002', 'DEP002'),
('EMP000003', '2019-08-22', NULL, 'JOB003', 'DEP001'),
('EMP000004', '2014-11-05', '2021-04-30', 'JOB004', 'DEP003'),
('EMP000005', '2016-09-18', '2019-06-15', 'JOB005', 'DEP002'),
('EMP000006', '2013-07-12', NULL, 'JOB006', 'DEP002'),
('EMP000007', '2020-01-20', '2023-01-15', 'JOB007', 'DEP001'),
('EMP000008', '2018-04-09', NULL, 'JOB008', 'DEP003'),
('EMP000009', '2021-05-30', NULL, 'JOB009', 'DEP001'),
('EMP000010', '2012-12-25', '2018-10-10', 'JOB010', 'DEP002');



select * from employee where salary>70000;

select First_name, salary from employee 
order by salary desc;

select avg(salary) from employee;

select department_id,count(employee_id) from employee
group by department_id;

select First_name from employee where First_name like "J%";

select Employee_id from job_history
order by start_date desc;

select department_id from employee 
group by department_id
having count(employee_id)>2;




select d.dept_name, sum(e.salary) from employee e 
join department d on d.department_id=e.department_id
group by d.dept_name;

select department_id,count(employee_id) from employee
group by department_id;

select * from employee 
where first_name like "J%" and last_name like "%e";

select count(employee_id), department_id from employee 
group by department_id
order by department_id;

select d.dept_name, avg(e.salary) from employee e 
join department d on d.department_id=e.department_id
group by dept_name
order by avg(e.salary) desc;

select d.dept_name, min(e.salary), max(e.salary), avg(e.salary) from employee e 
join department d on d.department_id=e.department_id
group by dept_name
having avg(e.salary)>50000;

select d.dept_name,max(e.salary),d.department_id from employee e 
join department d on d.department_id=e.department_id
group by d.dept_name,d.department_id
order by d.department_id;

select d.dept_name,sum(e.salary) from employee e
join department d on d.department_id=e.department_id
group by d.dept_name
having sum(e.salary)>60000;





select *, d.dept_name from employee e 
join department d on d.department_id=e.department_id;

select e.Employee_id,e.first_name,e.last_name,d.manager_name from employee e 
join department d on d.department_id=e.department_id;

select e.Employee_id,e.first_name,e.last_name,d.dept_name,j.job_title from employee e 
join department d on d.department_id=e.department_id
join jobs j on j.job_id=e.job_id;

select d.dept_name from department d 
left join employee e on d.department_id=e.department_id
where e.Employee_id is null;

SELECT d.department_id, d.dept_name, MAX(e.salary) FROM employee e
JOIN department d ON d.department_id = e.department_id
GROUP BY d.department_id, d.dept_name;

select sum(e.salary), j.job_title from employee e 
join jobs j on j.job_id=e.job_id
group by j.job_title;

select d.dept_name, avg(e.salary) from employee e
join department d on d.department_id=e.department_id
group by d.dept_name
order by avg(e.salary) desc;

SELECT e.employee_id, e.first_name, j.start_date, d.dept_name FROM employee e
JOIN department d ON d.department_id = e.department_id
join job_history j on j.employee_id=e.employee_id
where TIMESTAMPDIFF(YEAR, j.start_date, CURDATE()) > 5;





select d.manager_name,count(e.employee_id) from employee e 
join department d on d.department_id=e.department_id
group by d.manager_name;

select j.job_title,j.min_salary from jobs j
where j.min_salary  between 50000 and 120000; 

select e.first_name,e.last_name,j.job_title from employee e 
join jobs j on j.job_id=e.job_id
order by j.job_title asc;

select year(start_date), count(employee_id) from job_history 
group by year(start_date);

select e.first_name,e.last_name,jh.start_date, datediff(jh.last_date,jh.start_date)/365 from employee e
join job_history jh on e.employee_id = jh.employee_id
where datediff(jh.last_date, jh.start_date) / 365 > 3; 

select e.first_name,e.last_name,e.salary,d.dept_name from employee e 
join department d on e.department_id=d.department_id
order by e.salary desc;





select e.first_name,e.last_name from employee e 
where e.First_name like "%ar%";

select d.dept_name,avg(e.salary) from employee e
join department d on e.department_id=d.department_id
group by d.dept_name
having avg(e.salary)<60000;

select *,j.start_date from employee e 
join job_history j on e.Employee_id=j.Employee_id
where year(j.start_date)=2021;

select e.first_name,e.last_name,d.manager_name from employee e
join department d on e.department_id=d.department_id;

select e.first_name,e.last_name,j.start_date from employee e
join job_history j on e.Employee_id=j.Employee_id
where datediff(j.last_date,j.start_date)/365 between 2 and 5;

select j.job_title,count(e.employee_id) from employee e 
join jobs j on e.job_id=j.job_id
group by j.job_title;

select e.first_name,e.last_name,e.salary,jh.start_date from employee e 
join job_history jh on e.employee_id=jh.employee_id
order by jh.start_date,e.salary desc;

select e.first_name,e.last_name,e.salary,d.dept_name from employee e
join department d on e.department_id=d.department_id
order by dept_name desc,e.salary desc;

select month(start_date), count(employee_id) from job_history 
group by month(start_date);

select e.first_name,e.last_name, datediff(j.last_date,j.start_date)/365 from employee e
join job_history j on e.Employee_id=j.Employee_id
where datediff(j.last_date,j.start_date)/365
order by datediff(j.last_date,j.start_date)/365 desc
limit 1;

select first_name,last_name from employee
where last_name like "%son%";