use samu
SELECT * FROM emp2;
create trigger trigde1
on emp2
for delete
as 
print 'DELETION OF DEPARTMENT IS NOT ALLOWED'
ROLLBACK TRANSACTION
return

DELETE FROM emp2 where STATUS='Active'
SELECT * FROM emp2;

create table emp3
(
eno int,
ename varchar(10),
eadd varchar(10),
esal int,
doj Datetime
)

SELECT * FROM emp3;
insert into emp3 values(1,'samu','pune',10000,'07-09-2021');
insert into emp3 values(2,'vaishu','nashik',30000,'08-09-2021');
insert into emp3 values(3,'parag','aurangpura',40000,'09-09-2021');
insert into emp3 values(4,'samiksha','aurangabad',50000,'03-09-2021');
insert into emp3 values(5,'sam','akola',60000,'04-09-2021');


create trigger trig2
on emp3
for insert
as
declare @modifieddate datetime
select @modifieddate = doj from inserted
if (@modifieddate!=GETDATE())
begin
print 'the modified date should be current date.hence cannot be inserted'
ROLLBACK TRANSACTION
RETURN 
END

insert into emp3 values(4,'samiksha','aurangabad',50000,'03-09-2021');
insert into emp3 values(3,'parag','aurangpura',40000,'03-09-2021');

SELECT * FROM emp3;

create trigger trig4
on emp3
for update
as
if update(esal)
begin
declare @salary int
select @salary = esal
from emp3
if(@salary>3000)
begin
print 'the salary cannot be more than 3000'
ROLLBACK TRANSACTION
RETURN 
END
END


update emp3 
set esal = 3000
where eno=1

SELECT * FROM emp3;


//indexes//
select * from emp2;
CREATE INDEX idx_lastname
ON emp2 (LASTNAME);

CREATE INDEX idx_Name
ON emp2 (LASTNAME,FIRSTNAME);


SP_HELPINDEX emp2

//batch//

SELECT * FROM sys.databases;
GO
SELECT * FROM sys.all_views
GO