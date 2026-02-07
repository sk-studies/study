# 📘 Stored Procedure in SQL — Complete Guide

## 🧠 What is a Stored Procedure?

A **stored procedure** is a pre-written SQL program stored inside the database that can be executed whenever needed.

It is like a function inside the database.

Instead of writing SQL again and again, you store it once and call it whenever required.

> Stored Procedure = saved SQL logic inside database.

---

## 🏗️ Why Stored Procedures are Used?

Stored procedures are used to:

- Reuse SQL code
- Improve performance
- Reduce network traffic
- Add business logic in DB
- Increase security
- Automate tasks

Example:
Instead of running 5 queries separately → create one stored procedure.

---

## 📌 Advantages

### 1. Reusability

Write once, use many times.

### 2. Faster execution

Stored in compiled form inside DB.

### 3. Security

Users can execute procedure without direct table access.

### 4. Less network traffic

Call procedure once instead of sending multiple queries.

### 5. Business logic inside DB

Used in banking, payroll, billing systems.

---

## 🧾 Basic Syntax (PostgreSQL)

```
CREATE OR REPLACE PROCEDURE procedure_name()
LANGUAGE plpgsql
AS $$
BEGIN

   -- SQL statements

END;
$$;
```

---

## 🧪 Example 1 — Simple stored procedure

Increase salary of all employees by 10%.

```
CREATE OR REPLACE PROCEDURE increase_salary()
LANGUAGE plpgsql
AS $$
BEGIN
   UPDATE employees
   SET salary = salary * 1.10;
END;
$$;
```

Call procedure:

```
CALL increase_salary();
```

---

## 🧪 Example 2 — Procedure with parameters

Increase salary for specific employee.

```
CREATE OR REPLACE PROCEDURE update_salary(
    emp INT,
    new_sal INT
)
LANGUAGE plpgsql
AS $$
BEGIN
   UPDATE employees
   SET salary = new_sal
   WHERE emp_id = emp;
END;
$$;
```

Call:

```
CALL update_salary(101,90000);
```

---

## 🧪 Example 3 — Insert data using procedure

```
CREATE OR REPLACE PROCEDURE add_employee(
    eid INT,
    ename TEXT,
    sal INT,
    dept INT
)
LANGUAGE plpgsql
AS $$
BEGIN
   INSERT INTO employees(emp_id,name,salary,dept_id)
   VALUES(eid,ename,sal,dept);
END;
$$;
```

Call:

```
CALL add_employee(200,'Rohit',55000,1);
```

---

## 🔁 Stored Procedure with IF condition

```
CREATE OR REPLACE PROCEDURE bonus_proc(emp INT)
LANGUAGE plpgsql
AS $$
DECLARE sal INT;
BEGIN
   SELECT salary INTO sal FROM employees WHERE emp_id=emp;

   IF sal > 70000 THEN
      UPDATE employees SET salary = salary + 5000 WHERE emp_id=emp;
   ELSE
      UPDATE employees SET salary = salary + 2000 WHERE emp_id=emp;
   END IF;
END;
$$;
```

Call:

```
CALL bonus_proc(101);
```

---

## 🧠 Procedure vs Function

| Feature      | Procedure      | Function          |
| ------------ | -------------- | ----------------- |
| Return value | Not required   | Must return value |
| Call method  | CALL proc()    | SELECT func()     |
| Use case     | Business logic | Calculations      |

---

## ❌ Delete procedure

```
DROP PROCEDURE procedure_name;
```

---

## 🏆 Real-world usage

Stored procedures used in:

- Banking transactions
- Payroll systems
- E-commerce orders
- Batch processing
- Data migration
- Reporting systems

Every enterprise DB uses stored procedures.

---

## ⚠️ Disadvantages

- Hard to debug
- DB dependent (MySQL/Postgres syntax differs)
- Complex logic becomes messy
- Version control difficult

---

## 🧪 Practice Tasks

1. Create procedure to add employee
2. Create procedure to delete employee
3. Increase salary of all employees
4. Give bonus if salary < 50000
5. Count total employees using procedure

---

## 🧠 Interview Questions

**Q1: What is stored procedure?**
Precompiled SQL stored in database.

**Q2: Difference between function and procedure?**
Function returns value, procedure may not.

**Q3: Why use stored procedure?**
Performance, security, reuse.

**Q4: How to call procedure?**
Using CALL statement.

---

## 🎯 Summary

Stored Procedure:

- saved SQL program
- runs inside database
- reusable and fast
- used for business logic
- widely used in real production

Learning stored procedures makes you strong backend/database developer.
