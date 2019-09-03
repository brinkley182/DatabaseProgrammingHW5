drop table dept;
CREATE TABLE dept
( DEPTNO NUMBER(3) PRIMARY KEY,
 DNAME VARCHAR2(16),
 LOC VARCHAR2(16)
);

declare
    type NumTab is table of dept.DEPTNO%type;
    type NameTab is table of dept.DNAME%type;
    type LocTab is table of dept.LOC%type;
    num_tab NumTab:=NumTab(10,20,30,40,50);
    name_tab NameTab:=NameTab('Accounting','Research','Sales','Operations','Marketing');
    loc_tab LocTab:=LocTab('New York','Dallas','Chicago','Dallas','Boston');
begin
    forall i in num_tab.first..num_tab.last
        insert into dept values(num_tab(i),name_tab(i),loc_tab(i));
end;

