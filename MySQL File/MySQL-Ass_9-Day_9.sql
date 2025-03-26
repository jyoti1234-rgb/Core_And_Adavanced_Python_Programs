mysql> CREATE DATABASE compony_db;
ERROR 1007 (HY000): Can't create database 'compony_db'; database exists
mysql> USE company_db;
ERROR 1049 (42000): Unknown database 'company_db'
mysql> SHOW DATABASES;
+-------------------------+
| Database                |
+-------------------------+
| compony_db              |
| emp                     |
| information_schema      |
| mydatabase              |
| mysql                   |
| performance_schema      |
| sakila                  |
| studentmanagementsystem |
| sys                     |
| world                   |
+-------------------------+
10 rows in set (0.00 sec)

mysql> USE company_db;
ERROR 1049 (42000): Unknown database 'company_db'
mysql> USE compony_db;
Database changed
mysql> CREATE TABLE departments (
    -> department_id INT PRIMARY KEY,
    -> department_name VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE employees (
    -> employee_id INT PRIMARY KEY,
    -> employee_name VARCHAR(255) NOT NULL,
    -> department_id INT,
    -> FOREIGN KEY (department_id) REFERENCES departments (department_id)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO departments (department_id, department_name) VALUES
    -> (1, 'HR'),
    -> (2, 'IT'),
    -> (3, 'Finance'),
    -> (4, 'Marketing');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO employees (employee_id, employee_name, department_id) VALUES
    -> (101,'Jyoti', 1),
    -> (102,'Ashwita', 2),
    -> (103,'Sayali', 3),
    -> (104,'Samiksha', 4),
    -> (105,'Pradnya', NULL);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT
    -> employees.employee_name,
    -> departments.department_name
    -> FROM employees
    -> INNER JOIN departments ON employees.department_id = departments.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Jyoti         | HR              |
| Ashwita       | IT              |
| Sayali        | Finance         |
| Samiksha      | Marketing       |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> SELECT
    -> employees.employee_name,
    -> COALESCE(departments.department_name, 'NO Department') AS department_name
    -> FROM employees
    -> LEFT JOIN departments ON employees.department_id = departments.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Jyoti         | HR              |
| Ashwita       | IT              |
| Sayali        | Finance         |
| Samiksha      | Marketing       |
| Pradnya       | NO Department   |
+---------------+-----------------+
5 rows in set (0.00 sec)

mysql>