CREATE DATABASE Ironhack;

USE Ironhack;

CREATE TABLE students (
	student_id INT PRIMARY KEY,
    first_name VARCHAR(55),
    last_name VARCHAR(55),
    age INT);

INSERT INTO students (student_id, first_name, last_name, age)
VALUES (1, 'Jorge', 'Aguilar', 25);

SELECT * FROM students;

UPDATE students
set age = 30
WHERE student_id = 1;

SELECT * FROM students;

DROP TABLE students;

create temporary table  bank.loan_and_account 
select l.loan_id,l.account_id, a.district_id, l.amount,l.payments,a.frequency
from bank.loan l inner join bank.account a 
using (account_id);

SELECT * FROM bank.loan_and_account;