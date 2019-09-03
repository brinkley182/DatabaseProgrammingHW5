set serveroutput on
declare
    type dept_table is table of dept%ROWTYPE index by binary_integer;
    dep_tab dept_table;
begin
    select * bulk collect into dep_tab from dept;
    for i in 1..dep_tab.count loop
        dbms_output.put_line('Department Number: '||dep_tab(i).DEPTNO||', Department: '||dep_tab(i).DNAME||' , Location: '||dep_tab(i).LOC);
    end loop;
end;
