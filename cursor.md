# 📘 SQL Cursor — Complete Guide

## 🧠 What is a Cursor in SQL?

A **cursor** is a database object used to retrieve and process data **row by row** from a result set.

Normally SQL works on sets:

```
SELECT * FROM employees;
```

This returns all rows together.

But sometimes we need to process each row one by one.
That is where a cursor is used.

> Cursor = pointer that moves through rows one at a time.

---

## 🏗️ Why Cursor is Used?

Cursors are used when we need:

- Row-by-row processing
- Complex logic per row
- Conditional updates
- Looping through results
- Stored procedures

Example use cases:

- Salary calculation per employee
- Sending email per record
- Data migration
- Batch processing

---

## 📌 Cursor Life Cycle (Steps)

Every cursor follows 5 steps:

1. Declare cursor
2. Open cursor
3. Fetch rows
4. Process rows
5. Close cursor

---

## 🧾 Basic Cursor Syntax (PostgreSQL)

```
DECLARE cursor_name CURSOR FOR
SELECT column1, column2 FROM table_name;
```

---

## 🧪 Full Example

### Scenario

Loop through employees and print their names.

```
BEGIN;

DECLARE emp_cursor CURSOR FOR
SELECT name FROM employees;

FETCH NEXT FROM emp_cursor;

CLOSE emp_cursor;

END;
```

---

## 🧠 Cursor inside function (real usage)

```
DO $$
DECLARE
    emp_record RECORD;
    emp_cursor CURSOR FOR SELECT name, salary FROM employees;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Employee: %, Salary: %',
        emp_record.name, emp_record.salary;
    END LOOP;

    CLOSE emp_cursor;
END $$;
```

This loops through all employees.

---

## 🔄 Cursor with UPDATE example

Increase salary by 10% for all employees:

```
DO $$
DECLARE
    rec RECORD;
    cur CURSOR FOR SELECT emp_id, salary FROM employees;
BEGIN
    OPEN cur;

    LOOP
        FETCH cur INTO rec;
        EXIT WHEN NOT FOUND;

        UPDATE employees
        SET salary = rec.salary * 1.10
        WHERE emp_id = rec.emp_id;

    END LOOP;

    CLOSE cur;
END $$;
```

---

## 🧠 Types of Cursor

### 1. Implicit Cursor

Automatically created by database.

Example:

```
UPDATE employees SET salary=50000 WHERE emp_id=1;
```

Database internally uses cursor.

---

### 2. Explicit Cursor

Manually created by developer.

Example:

```
DECLARE emp_cursor CURSOR FOR SELECT * FROM employees;
```

---

## ⚠️ Disadvantages of Cursor

- Slow for large data
- Row-by-row processing heavy
- Consumes memory
- Avoid when possible
- Set-based queries faster

Instead of cursor prefer:

```
JOIN
UPDATE
GROUP BY
WINDOW FUNCTIONS
```

---

## 🏆 When to Use Cursor

Use only when:

- Complex row logic needed
- Cannot solve using JOIN or SQL query
- Stored procedure processing
- Batch updates

Avoid for simple SELECT queries.

---

## 📊 Cursor vs Normal Query

| Feature    | Normal Query      | Cursor        |
| ---------- | ----------------- | ------------- |
| Speed      | Fast              | Slower        |
| Processing | All rows together | Row by row    |
| Memory     | Low               | Higher        |
| Use case   | Most queries      | Special logic |

---

## 🧪 Practice Tasks

1. Create cursor to print all employee names
2. Increase salary of all employees using cursor
3. Show only employees with salary > 60000 using cursor
4. Count employees using cursor
5. Update department for each employee using cursor

---

## 🧠 Interview Questions

**Q1: What is cursor?**
Pointer to process rows one by one.

**Q2: Why cursor used?**
Row-by-row processing.

**Q3: Cursor vs JOIN?**
JOIN faster. Cursor slower.

**Q4: Should we always use cursor?**
No. Use only when required.

---

## 🎯 Summary

Cursor:

- processes data row by row
- used in stored procedures
- slower than normal queries
- useful for complex logic

Use carefully in real projects.
