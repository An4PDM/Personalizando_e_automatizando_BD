CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE employee (
    ssn INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50),
    minit CHAR(1),
    lname VARCHAR(50),
    sex ENUM('f','m','o'),
    bdate DATE,
    address VARCHAR(100),
    salary DECIMAL(10, 2),
    super_ssn INT, -- auto_relacionamento
    dno INT,
    FOREIGN KEY (super_ssn) REFERENCES employee(ssn)
);

CREATE TABLE department (
    dnumber INT PRIMARY KEY AUTO_INCREMENT,
    dname VARCHAR(50),
    mgr_ssn INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
);

ALTER TABLE employee ADD FOREIGN KEY (dno) REFERENCES department(dnumber);

CREATE TABLE dept_location (
    dnumber INT,
    dlocation VARCHAR(100),
    PRIMARY KEY (dnumber, dlocation),
    FOREIGN KEY (dnumber) REFERENCES department(dnumber)
);

CREATE TABLE project (
    pnumber INT PRIMARY KEY AUTO_INCREMENT,
    pname VARCHAR(50),
    plocation VARCHAR(100),
    dnum INT,
    FOREIGN KEY (dnum) REFERENCES department(dnumber)
);

CREATE TABLE works_on (
    essn INT,
    pno INT,
    hours DECIMAL(5, 2),
    PRIMARY KEY (essn, pno),
    FOREIGN KEY (essn) REFERENCES employee(ssn),
    FOREIGN KEY (pno) REFERENCES project(pnumber)
);

CREATE TABLE dependent (
    essn INT,
    dependent_name VARCHAR(50),
    sex ENUM('f','m','o'),
    bdate DATE,
    relationship VARCHAR(20),
    PRIMARY KEY (essn, dependent_name),
    FOREIGN KEY (essn) REFERENCES employee(ssn)
);

-- Inserindo dados na tabela department
INSERT INTO department (dname, mgr_ssn, mgr_start_date) VALUES
('HR', NULL, '2022-01-01'),
('IT', NULL, '2022-01-02'),
('Finance', NULL, '2022-01-03'),
('Marketing', NULL, '2022-01-04'),
('Sales', NULL, '2022-01-05');

-- Inserindo dados na tabela employee
INSERT INTO employee (fname, minit, lname, sex, bdate, address, salary, super_ssn, dno) VALUES
('Alice', 'A', 'Smith', 'f', '1990-05-15', '123 Main St', 50000.00, NULL, 1),
('Bob', 'B', 'Johnson', 'm', '1985-03-22', '456 Elm St', 55000.00, 1, 2),
('Charlie', 'C', 'Williams', 'm', '1992-07-30', '789 Oak St', 60000.00, 1, 1),
('Diana', 'D', 'Brown', 'f', '1988-12-11', '135 Pine St', 65000.00, 1, 3),
('Eva', 'E', 'Davis', 'f', '1995-11-25', '246 Maple St', 70000.00, 1, 4);

-- Inserindo dados na tabela dept_location
INSERT INTO dept_location (dnumber, dlocation) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'Phoenix');

-- Inserindo dados na tabela project
INSERT INTO project (pname, plocation, dnum) VALUES
('Project A', 'New York', 1),
('Project B', 'Los Angeles', 2),
('Project C', 'Chicago', 3),
('Project D', 'Houston', 4),
('Project E', 'Phoenix', 5);

-- Inserindo dados na tabela works_on
INSERT INTO works_on (essn, pno, hours) VALUES
(1, 1, 10.5),
(1, 2, 8.0),
(2, 1, 7.5),
(3, 3, 9.0),
(4, 4, 6.0);

-- Inserindo dados na tabela dependent
INSERT INTO dependent (essn, dependent_name, sex, bdate, relationship) VALUES
(1, 'John', 'm', '2015-01-10', 'Son'),
(1, 'Emily', 'f', '2018-02-20', 'Daughter'),
(2, 'Michael', 'm', '2016-03-30', 'Son'),
(3, 'Sara', 'f', '2017-04-15', 'Daughter'),
(4, 'Tom', 'm', '2019-05-25', 'Son');

-- Inserindo gerentes na tabela employee
INSERT INTO employee (fname, minit, lname, sex, bdate, address, salary, super_ssn, dno) VALUES
('Jana', 'M', 'Flores', 'f', '1996-02-15', '3 Lik St', 75000.00, 1, 1),
('Ana', 'P', 'Melo', 'f', '2005-03-22', '45 St', 75000.00, 1, 2),
('Lisa', 'C', 'Robs', 'f', '1992-07-30', '9 Vis St', 75000.00, 1, 3),
('Alex', 'D', 'Torres', 'm', '1988-12-11', '35 Nell St', 75000.00, 1, 4),
('Bill', 'E', 'Grimmes', 'm', '1995-11-25', '24 Apple St', 75000.00, 1, 5);

UPDATE department SET mgr_ssn = 6 WHERE dnumber = 1;
UPDATE department SET mgr_ssn = 7 WHERE dnumber = 2;
UPDATE department SET mgr_ssn = 8 WHERE dnumber = 3;
UPDATE department SET mgr_ssn = 9 WHERE dnumber = 4;
UPDATE department SET mgr_ssn = 10 WHERE dnumber = 5;
