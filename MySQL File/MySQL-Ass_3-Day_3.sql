Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> INSERT INTO Employee (emp_id, first_name, last_name, age, email)
    -> VALUES
    ->   (1, 'Jyoti', 'Lohkare', 22, 'jyoti.lohkare@example.com'),
    ->   (2, 'Ashwita', 'Aher', 23, 'ashwita.aher@example.com'),
    ->   (3, 'Sweety', 'Arude', 30, 'sweety.arude@example.com'),
    ->   (4, 'Sayali', 'Gawade', 25, 'sayali.gawade@example.com'),
    ->   (5, 'Omkar', 'Dhage', 32, 'omkar.dhage@example.com');
ERROR 1046 (3D000): No database selected
mysql>
mysql> SELECT first_name, last_name
    -> FROM Employee;
ERROR 1046 (3D000): No database selected
mysql> SHOW DATABASES;
+-------------------------+
| Database                |
+-------------------------+
| information_schema      |
| mysql                   |
| performance_schema      |
| sakila                  |
| studentmanagementsystem |
| sys                     |
| world                   |
+-------------------------+
7 rows in set (0.01 sec)

mysql> USE mydatabase;
ERROR 1049 (42000): Unknown database 'mydatabase'
mysql> CREATE DATABASE mydatabase;
Query OK, 1 row affected (0.02 sec)

mysql> USE mydatabase;
Database changed
mysql> CREATE TABLE Employee (
    ->     emp_id INT PRIMARY KEY,
    ->     first_name VARCHAR(50),
    ->     last_name VARCHAR(50),
    ->     age INT,
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Employee (emp_id, first_name, last_name, age, email)
    -> VALUES
    ->   (1, 'Jyoti', 'Lohkare', 22, 'jyoti.lohkare@example.com'),
    ->   (2, 'Ashwita', 'Aher', 23, 'ashwita.aher@example.com'),
    ->   (3, 'Sweety', 'Arude', 30, 'sweety.arude@example.com'),
    ->   (4, 'Sayali', 'Gawade', 25, 'sayali.gawade@example.com'),
    ->   (5, 'Omkar', 'Dhage', 32, 'omkar.dhage@example.com');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT first_name, last_name FROM Employee;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Jyoti      | Lohkare   |
| Ashwita    | Aher      |
| Sweety     | Arude     |
| Sayali     | Gawade    |
| Omkar      | Dhage     |
+------------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT first_name, last_name, age
    -> FROM Employee
    -> WHERE age > 30;
+------------+-----------+------+
| first_name | last_name | age  |
+------------+-----------+------+
| Omkar      | Dhage     |   32 |
+------------+-----------+------+
1 row in set (0.01 sec)

mysql> UPDATE Employee
    -> SET age = age + 1
    -> WHERE age > 25;
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0