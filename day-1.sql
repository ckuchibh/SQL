select 2*3 from dual;

select * from scott.emp;

describe scott.emp;

select ename, empno from scott.emp where job='MANAGER' or deptno=10;


create table salesman (
 salesman_id int not null,
 salesman_name varchar2(32),
 salesman_city varchar2(32),
 commission int);
 
 INSERT INTO salesman VALUES(5002, 'Nail Knite', 'Paris', 13);
 
 INSERT ALL 
    INTO salesman VALUES(5005, 'Pit Alex', 'London', 11) 
    INTO salesman VALUES(5006, 'McLyon', 'Paris', 14) 
    INTO salesman VALUES(5007, 'Paul Adam', 'Rome', 13) 
    INTO salesman VALUES(5003, 'Lauson Hen', 'San Jose', 12) 
SELECT 1 FROM DUAL;
 
 drop table salesman;
 
 select * from salesman;
 
 alter table salesman add grade int;
 
 update salesman set grade=100;
 
 update salesman set name='Pierre' where commission=14;
 
 
 select * from scott.emp;
 
 select * from scott.emp where deptno not in (10,20);
 
 select * from scott.emp order by deptno, ename desc;
 
 select distinct deptno from scott.emp;
 
 
 -- Create a table named orders
create table orders(
    order_no int primary key, purchase_amount float, order_date date,
    customer_id int, salesman_id int);

-- Add values to the table
INSERT ALL
    INTO orders VALUES(70001, 150.5, TO_DATE('2012/10/05', 'YYYY/MM/DD'), 3005, 5002) 
    INTO orders VALUES(70009, 270.65, TO_DATE('2012/09/10', 'YYYY/MM/DD'), 3001, 5005)
    INTO orders VALUES(70002, 65.26, TO_DATE('2012/10/05', 'YYYY/MM/DD'), 3002, 5001)
    INTO orders VALUES(70004, 110.5, TO_DATE('2012/08/17', 'YYYY/MM/DD'), 3009, 5003)
    INTO orders VALUES(70007, 948.5, TO_DATE('2012/09/10', 'YYYY/MM/DD'), 3005, 5002)
    INTO orders VALUES(70005, 2400.6, TO_DATE('2012/07/27', 'YYYY/MM/DD'), 3007, 5001)
    INTO orders VALUES(70008, 5760, TO_DATE('2012/08/15', 'YYYY/MM/DD'), 3002, 5001)
SELECT 1 FROM DUAL;
 
INSERT ALL
    INTO orders VALUES(70010, 1983.43, TO_DATE('2012/10/10', 'YYYY/MM/DD'), 3004, 5006)
    INTO orders VALUES(70003, 2480.4, TO_DATE('2012/10/10', 'YYYY/MM/DD'), 3009, 5003)
    INTO orders VALUES(70012, 250.45, TO_DATE('2012/06/27', 'YYYY/MM/DD'), 3008, 5002)
    INTO orders VALUES(70011, 75.29, TO_DATE('2012/08/17', 'YYYY/MM/DD'), 3003, 5007)
    INTO orders VALUES(70013, 3045.6, TO_DATE('2012/04/25', 'YYYY/MM/DD'), 3002, 5001)
SELECT 1 FROM DUAL;


select * from scott.emp;

select deptno, count(*) from scott.emp
group by deptno
having count(*) > 2
order by deptno ;

select count(distinct salesman_id) from orders;
select customer_id, max(purchase_amount) from orders group by customer_id;


select * from scott.emp;

select * from scott.dept;

select e.empno, e.ename, d.dname,d.loc
from scott.emp e, scott.dept d
where e.deptno=d.deptno;

select e.empno, e.ename, d.dname, d.loc from scott.emp e
inner join scott.dept d
on e.deptno=d.deptno;

select * from hr.employees;

select count(distinct department_id) from hr.employees;

select count(*) from hr.employees where department_id is null;

select count(*) from hr.departments;

select * from hr.departments;


select d.department_id, d.department_name,count(e.employee_id) from hr.employees e
left outer join hr.departments d
on e.department_id=d.department_id
group by d.department_id, d.department_name;


select * from scott.emp;

empno, ename, mgr name

select e.empno, e.ename, m.ename
from scott.emp e, scott.emp m
where e.mgr=m.empno;



select empno, ename, job, mgr, sal, deptno from scott.emp where job in ('MANAGER','SALESMAN')
minus
select empno, ename, job, mgr, sal, deptno from scott.emp where job='MANAGER';

select * from scott.emp where deptno=30 ;

select avg(sal) from scott.emp where deptno=30;

select * from scott.emp o where o.sal > (select avg(sal) from scott.emp i where i.deptno=o.deptno);

-- Create the customers table
create table customers (
    customer_id int primary key, customer_name varchar(32),
    city varchar(20), grade int, salesman_id int);

-- Insert values into it
insert all  
into customers values (3002, 'Nick Rimando', 'New York', 100, 5001)
into customers values(3007, 'Brad Davis', 'New York', 200, 5001)
into customers values (3005, 'Graham Zusi', 'California', 200, 5002)
into customers values(3008, 'Julian Green', 'London', 300, 5002)
into customers values (3004, 'Fabian Johnson', 'Paris', 300, 5006)
into customers values(3009, 'Geoff Cameron', 'Berlin', 100, 5003)
into customers values (3003, 'Jozy Altidor', 'Moscow', 200, 5007)
into customers values(3001, 'Brad Guzan', 'London', 300, 5005)
select 1 from dual;

select * from customers;

select * from salesman;

SELECT a.customer_name AS "Customer Name", a.city, b.salesman_name AS "Salesman", b.commission FROM customers a 
INNER JOIN salesman b ON a.salesman_id=b.salesman_id;



























 