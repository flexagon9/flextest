create or replace package test_customer as
  -- %suite(Customer validation)
  
  -- %test(Check count of Architect)
  procedure check_architect;
  
   -- %test(Returns employee from Norway)
  procedure check_Norway_employee;
end;
/

create or replace package body test_customer as

  procedure check_architect is
    Emp_count   INTEGER := 20;
  begin
    select count(1) into Emp_count from Customer where upper(Designation)='ARCHITECT';
    ut.expect(Emp_count).to_equal(2);
  end;
  
  procedure check_Norway_employee is
    emp_name1 VARCHAR2(20);
  begin
    select Name into emp_name1 from Customer where upper(Country)='NORWAY';
    ut.expect( emp_name1 ).to_equal('Nio');
  end;
end;