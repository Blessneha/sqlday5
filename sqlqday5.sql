create database assign5
use assign5

create function fn_Add(@a int,@b int)
returns int
as 
begin
declare @res int
set @res=@a+@b
return @res
end
-- call a functions
select dbo.fn_Add(2,3) as output

CREATE FUNCTION Trim (@var VARCHAR(250))
RETURNS VARCHAR(250)
AS 
begin
RETURN LTRIM(RTRIM(@var))
end

select'*'+dbo.Trim('  dndnd  ')+'#'

create function removenumbers(@res varchar(200))
returns varchar(200)
as
begin
declare @newstr varchar(200)=''
declare @cou int=1
declare @cha char(1)
while @cou<=len(@res)
begin
set @cha=substring(@res,@cou,1)
if isnumeric(@cha)=0
begin
set @newstr+=@cha
end
set @cou+=1
end
return @newstr
end



select dbo.removenumbers('tres123pass')

CREATE FUNCTION Phone123 (@Phone VARCHAR(10))
RETURNS VARCHAR(14)
AS 
BEGIN
 DECLARE @NewPhone VARCHAR(14);
 SET @NewPhone = '(' + SUBSTRING(@Phone,1,3) + ') '
 SET @NewPhone = @NewPhone + SUBSTRING(@Phone,4,3) + '-'
 SET @NewPhone = @NewPhone + SUBSTRING(@Phone,7,4)
 RETURN @NewPhone
END
SELECT dbo.Phone123('5555555535')

create table dest(Id INT PRIMARY KEY, 
        LName VARCHAR(50))

CREATE TYPE srctable1 AS TABLE
(Id   INT, 
 LName VARCHAR(50)
)




CREATE PROCEDURE Usp_Insertdest
@Parsrctable srctable1  READONLY
AS
INSERT INTO  dest
SELECT * FROM @Parsrctable

DECLARE @VarsrcType AS srctable1
 
INSERT INTO @VarsrcType
VALUES ( 1, 'Math'
       )
INSERT INTO @VarsrcType
VALUES ( 2, 'Science'
       )
INSERT INTO @VarsrcType
VALUES ( 3, 'Geometry'
       )
	   EXECUTE Usp_Insertdest @VarsrcType
select*from dest

create table emp123(empid int,salary int)

create trigger tri1
on emp123
for update
as
declare @newva int
declare @olva int
select @newva=salary from inserted
select @olva=salary from deleted
if @newva<@olva
Rollback Transaction
print 'Access denied '

insert into emp123 values(1,2000)
insert into emp123 values(2,3000)
insert into emp123 values(3,1000)
insert into emp123 values(4,2000)
insert into emp123 values(5,3000)
insert into emp123 values(6,1000)


update emp123 set salary=salary+200 where empid=5
create table empl(username varchar(25),date1 date,salary int)
insert into empl values('Brian','2007-09-22',200000)
insert into empl values('Brenda','2017-08-21',200001)
insert into empl values('hailey','2020-01-20',200002)
create table login(username varchar(20),modifiedate date,modifiedata int)

create trigger trig2
on empl
for INSERT,UPDATE,DELETE
as
begin
declare @username varchar(20)
declare @date date
declare @modi int
select @date=date1 from empl
select @username=username from empl
if exists(select*from deleted)
  select @modi=salary from deleted

insert into login values(@username,@date,@modi)
end

insert into empl values('gres',getdate(),20)
update empl set salary=50 where username='gres'

select*from login






