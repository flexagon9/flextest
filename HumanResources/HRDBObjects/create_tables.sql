CREATE TABLE HRDEMO.departments
( department_id number(10) NOT NULL,
  department_name varchar2(50) NOT NULL,
  CONSTRAINT departments_pk PRIMARY KEY (department_id)
);
CREATE TABLE HRDEMO.employees
( employee_number number(10) NOT NULL,
  employee_name varchar2(50) NOT NULL,
  department_id number(10),
  salary number(6),
  CONSTRAINT employees_pk PRIMARY KEY (employee_number),
  CONSTRAINT fk_departments
    FOREIGN KEY (department_id)
    REFERENCES HRDEMO.departments(department_id)
);

