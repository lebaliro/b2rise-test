DROP TABLE IF EXISTS employees ;

CREATE TABLE IF NOT EXISTS employees  (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR,
    salary DECIMAL
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'João', 4000),
(2, 'Maria', 5000),
(3, 'Pedro', 6000),
(4, 'Jose', 3000),
(5, 'Fernando', 2500),
(6, 'Marcela', 7000);

SELECT * 
FROM employees
ORDER BY id;

UPDATE employees
SET salary = salary * 1.1
WHERE salary < 5000;

SELECT * 
FROM employees
ORDER BY id;
