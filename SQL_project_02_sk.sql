-- project_02_sk --

-- 1. Create new schema as alumni --
create schema alumni;
use alumni;

-- 2.Import all .csv files into MySQL --
# All .csv file have imported in MySQL.
select * from college_a_hs;
select * from college_a_sj;
select * from college_b_hs;
select * from college_a_se;
select * from college_b_se;
select * from college_b_sj;

-- 3. Run SQL command to see the structure of six tables --
desc college_a_hs;
desc college_a_sj;
desc college_b_hs;
desc college_a_se;
desc college_b_se;
desc college_b_sj;

-- 4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python. --
## college_a_hs
#import mysql
#import mysql.connector
#testdb=mysql.connector.connect(host='localhost',user='root',password='7575',database='alumni')
#cur_obj=testdb.cursor()
#cur_obj.execute('select * from college_a_hs limit 1000')
#cur_obj.fetchall()
## college_b_sj
#cur_obj.execute('select * from college_b_sj limit 1000')
#cur_obj.fetchall()
## college_a_se
#cur_obj.execute('select * from college_a_se limit 1000')
#cur_obj.fetchall()
## college_a_sj
#cur_obj.execute('select * from college_a_sj limit 1000')
#cur_obj.fetchall()
## college_b_hs
#cur_obj.execute('select * from college_b_hs limit 1000')
#cur_obj.fetchall()
## college_b_se
#cur_obj.execute('select * from college_b_se limit 1000')
#cur_obj.fetchall()

-- 5. Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel. --
# screen shot is given below.

-- 6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. --
CREATE VIEW college_a_hs_v AS
    SELECT 
        *
    FROM
        college_a_hs
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND presentstatus IS NOT NULL;

-- 7. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values. --
CREATE VIEW college_a_se_v AS
    SELECT 
        *
    FROM
        college_a_se 
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND presentstatus IS NOT NULL;

-- 8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
CREATE VIEW college_a_sj_v AS
    SELECT 
        *
    FROM
        college_a_sj
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND presentstatus IS NOT NULL;
            
-- 9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values. --
CREATE VIEW college_b_hs_v AS
    SELECT 
        *
    FROM
        college_b_hs
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND presentstatus IS NOT NULL;
            
-- 10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values. --

CREATE VIEW college_b_se_v AS
    SELECT 
        *
    FROM
        college_b_se
    WHERE
        rollno IS NOT NULL
            AND lastupdate IS NOT NULL
            AND name IS NOT NULL
            AND fathername IS NOT NULL
            AND mothername IS NOT NULL
            AND branch IS NOT NULL
            AND batch IS NOT NULL
            AND degree IS NOT NULL
            AND presentstatus IS NOT NULL;
            
-- 11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V. --
CREATE VIEW college_b_sj_v AS
    SELECT 
        *
    FROM
        college_b_sj
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus  IS NOT NULL
            AND organization  IS NOT NULL
            AND designation IS NOT NULL
            AND Location IS NOT NULL;
            
-- 12. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V)  --
-- college_a_hs:
delimiter //
create procedure c_a_hs()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_a_hs;
end//
delimiter ;

call c_a_hs();

-- college_a_se:
delimiter //
create procedure c_a_se()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_a_se;
end//
delimiter ;

call c_a_se();

-- college_a_sj:
delimiter //
create procedure c_a_sj()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_a_sj;
end//
delimiter ;

call c_a_sj();

-- college_b_hs:
delimiter //
create procedure c_b_hs()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_b_hs;
end//
delimiter ;

call c_b_hs();

-- college_b_se:
delimiter //
create procedure c_b_se()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_b_se;
end//
delimiter ;

call c_b_se();

-- college_b_sj:
delimiter //
create procedure c_b_sj()
begin 
select lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName from college_b_sj;
end//
delimiter ;

call c_b_sj();

-- 13.Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot chart for location of Alumni. -- 
# the screen shot is attached in word.

-- 14. Write a query to create procedure get_name using the cursor to fetch names of all students from college A. --
delimiter //
CREATE procedure get_name()
BEGIN
declare cont1 int;
declare temp1 text;
declare temp1_1 text;
declare cur_a cursor for select name from college_a;
set cont1 = (select sum(case when name is not null then 1 or 1 end) from college_a);

open cur_a;
loop1:loop
	fetch cur_a into temp1;
    set temp1_1=concat_ws(',',temp1,temp1_1);
    if cont1 = 1 then leave loop1;
    end if;
    set cont1 = cont1-1;
end loop;
select temp1_1 ;
close cur_a;
end //
delimiter ;
drop procedure get_name;

call get_name();


-- 15. Write a query to create procedure get_name using the cursor to fetch names of all students from college B. --

 delimiter //
CREATE procedure get_name1()
BEGIN
declare cont2 int;
declare temp2 text;
declare temp2_2 text;
declare cur_b cursor for select name from college_b;
set cont2 = (select sum(case when name is not null then 1 or 1 end) from college_b);

open cur_b;
loop2:loop
	fetch cur_b into temp2;
    set temp2_2=concat_ws(',',temp2,temp2_2);
    if cont2 = 1 then leave loop2;
    end if;
    set cont2 = cont2-1;
end loop;
select temp2_2 ;
close cur_b;
end //
delimiter ;
drop procedure get_name1;
call get_name1();

-- 16. Calculate the percentage of career choice of College A and College B Alumni (w.r.t Higher Studies, Self Employed and Service/Job) --

## college A 
SELECT 
    'Percent in Higher studies' AS 'Career choice in percentage',
    (COUNT(college_a_hs.rollno) / 5884) * 100 'College A'
FROM
    college_a_hs 
UNION SELECT 
    'Percent in Self Employes',
    (COUNT(college_a_se.rollno) / 5884) * 100
FROM
    college_a_se 
UNION SELECT 
    'Percent in Service/Job',
    (COUNT(college_a_sj.rollno) / 5884) * 100
FROM
    college_a_sj;
    
    
## college B 
select
    'Percent in Higher studies' as 'Career choice in percentage', 
    (COUNT(college_b_hs.rollno) / 2259) * 100 'College B'
FROM
    college_b_hs 
UNION SELECT 
    'Percent in Self Employes',
    (COUNT(college_b_se.rollno) / 2259) * 100
FROM
    college_b_se 
UNION SELECT 
    'Percent in Service/Job',
    (COUNT(college_b_sj.rollno) / 2259) * 100
FROM
    college_b_sj;
