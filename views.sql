USE company;
-- Número de empregados por departamento e localidade

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM dept_location;

CREATE VIEW employee_from_department_count AS
SELECT COUNT(*) AS employee_count, d.dname FROM department d
INNER JOIN dept_location dl ON dl.dnumber = d.dnumber
INNER JOIN employee e ON e.dno = d.dnumber
GROUP BY e.dno;

