# 📘 SQL Indexing — Complete Guide

## 🧠 What is an Index?

An **index** in SQL is a special data structure that improves the speed of data retrieval from a table.

Think of a book:

- Without index → you read every page to find a topic
- With index → you directly jump to page number

Database index works exactly like that.

It helps database find rows faster instead of scanning the full table.

---

## 🏗️ Why Index is Important?

Without index:

```
SELECT * FROM employees WHERE name='Swapnil';
```

Database checks every row (full table scan).

With index:
Database jumps directly to matching rows.

Result:

- Faster queries
- Better performance
- Essential for large tables

---

## 📌 When to Use Index?

Use index on:

- Columns used in WHERE clause
- JOIN columns
- ORDER BY columns
- PRIMARY KEY
- Frequently searched columns

Example:

```
WHERE email = ?
WHERE emp_id = ?
JOIN ON dept_id
```

---

## 🧾 Basic Syntax

### Create index

```
CREATE INDEX index_name
ON table_name(column_name);
```

Example:

```
CREATE INDEX idx_emp_name
ON employees(name);
```

---

## 🔎 Check existing indexes

```
SELECT * FROM pg_indexes
WHERE tablename = 'employees';
```

---

## ❌ Delete index

```
DROP INDEX idx_emp_name;
```

---

## 🧪 Example with employees table

Without index:

```
SELECT * FROM employees WHERE email='swapnil@mail.com';
```

Create index:

```
CREATE INDEX idx_email
ON employees(email);
```

Now search becomes very fast.

---

## 🧠 Types of Indexes

### 1. Single Column Index

```
CREATE INDEX idx_salary ON employees(salary);
```

### 2. Composite Index (multiple columns)

```
CREATE INDEX idx_name_dept
ON employees(name, dept_id);
```

Used when query has both columns:

```
WHERE name='Amit' AND dept_id=1
```

### 3. Unique Index

Prevents duplicate values.

```
CREATE UNIQUE INDEX idx_email_unique
ON employees(email);
```

Now duplicate email cannot be inserted.

---

## ⚡ Primary Key = Index

When you create primary key:

```
PRIMARY KEY(emp_id)
```

PostgreSQL automatically creates index.

---

## 📊 How index improves performance

Without index:

```
Time: 2 sec (scan 1 million rows)
```

With index:

```
Time: 0.01 sec
```

Huge difference in big tables.

---

## ⚠️ When NOT to use index

Avoid too many indexes because:

- Slows INSERT/UPDATE
- Takes storage
- Extra maintenance

Do NOT index:

- very small tables
- columns rarely used
- columns with few unique values (gender)

---

## 🏆 Real-world usage

Used in:

- Banking apps
- E-commerce search
- Login systems
- Large analytics queries
- Production databases

Every big company relies on indexing.

---

## 🧪 Practice tasks

1. Create index on employee name
2. Create index on salary
3. Create composite index (dept_id, salary)
4. Drop index
5. Check indexes in table

---

## 🧠 Interview Questions

**Q1: What is index?**
→ Improves query performance

**Q2: Does index store data?**
→ Stores pointer to data

**Q3: Can too many indexes slow DB?**
→ Yes (insert/update slow)

**Q4: Primary key creates index?**
→ Yes automatically

---

## 🎯 Summary

Index is:

- performance booster
- used for fast search
- essential in real production DB
- must be used wisely

Without index → slow queries
With index → fast database

---

## 🚀 Next Topics to Learn

After indexing:

- Window functions
- CTE
- Query optimization
- Execution plan
- Advanced joins

These make you strong SQL developer.
