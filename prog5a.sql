drop table dept;
drop table dept_shadow;
CREATE TABLE dept
( DEPTNO NUMBER(3) PRIMARY KEY,
 DNAME VARCHAR2(16),
 LOC VARCHAR2(16)
);
CREATE TABLE dept_shadow
( DEPTNO NUMBER(3) PRIMARY KEY,
 DNAME VARCHAR2(16),
 LOC VARCHAR2(16),
 USER_name VARCHAR2(32),
 MODTIME CHAR(17)
);

create trigger log_dept after insert on dept for each row
begin

insert into dept_shadow values(:new.DEPTNO,:new.DNAME, :new.LOC,user,TO_CHAR(sysdate,'MM-DD-YY HH24:MI:SS'));
end;

insert into dept values(111,'x', 'd');
select * from dept;
select * from dept_shadow;