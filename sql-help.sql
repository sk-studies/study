select max(sal) as avgmaxsal from (select avg(salary) as sal,dept_id from public.employees group by dept_id) as t;

select * from public.employees;

select count(gender) ,gender as totalcount from public.employees group by gender;

select  *  from public.employees where name like '%nil';

select e.name , p.project_name , d.dept_name from employees e inner join departments d on e.dept_id = d.dept_id
inner join projects p on p.dept_id = d.dept_id