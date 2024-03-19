select * 
from hr_1
join hr_2 on hr_1.EmployeeNumber = hr_2.Employeeid;


#1..KPI.. (Average Attrition rate for all Departments.)

select a.Department, concat(format(avg(a.attrition_y)*100,2),'%') as 'Attrition_rate'

from ( select Department, Attrition,
    case when attrition = 'yes'
then 1
else 0
end as attrition_y from hr_1) as a 
group by a.Department;



 #2..KPI..( Average Hourly rate of Male Research Scientist.)
 
SELECT hr_1.JobRole,hr_1.Gender,round(avg(hr_1.hourlyrate),2) as 'Average_hourly_rate' from hr_1
inner join hr_2
WHERE gender = 'Male' AND jobRole = 'Research Scientist';



#3..KPI... Attrition rate Vs Monthly income stats..

select a.department , concat(format(avg(a.attrition_rate)*100,2),'%') as Attrition_rate,format(avg(b.monthlyincome),2) as monthly_income_stats
from ( select department , attrition , employeenumber,
case when attrition = 'yes' then 1
 else 0
end as attrition_rate from hr_1) as a
inner join hr_2 as b on b.Employeeid = a.EmployeeNumber
group by a.department;



#4..KPI.. (Average working years for each Department)

select a.Department, format(avg(b.totalworkingyears),1) as Average_working_years
from hr_1 as a 
inner join hr_2 as b on b. Employeeid = a.EmployeeNumber
group by a.Department;


#5...KPI..(Job Role Vs Work life balance)..

select hr_1.JobRole, round(avg(hr_2.worklifebalance),2) as work_life_balance
from hr_1 inner join hr_2
on hr_1.EmployeeNumber = hr_2.Employeeid
group by JobRole;


#6...KPI..(Attrition rate Vs Year since last promotion relation against jobRole.)

select a.JobRole, concat(format(avg(a.attrition_rate)*100,2), '%') as Attrition_rate ,
format(avg(b.yearssincelastpromotion),2) as Years_since_last_promotion
from ( select JobRole , attrition , employeenumber,
case when attrition = 'yes' then 1 
else 0
end as attrition_rate from hr_1) as a 
inner join hr_2 as b on b.Employeeid = a.employeenumber
group by a.jobrole;





 

