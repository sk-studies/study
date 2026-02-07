# 📘 SQL VIEW — Complete Guide

## 🧠 What is a VIEW in SQL?

A **VIEW** is a virtual table in SQL.
It does not store data physically.
Instead, it stores a **SQL query** and shows results like a table.

Think of it as:

> A saved SELECT query that behaves like a table.

Whenever you query a view, the database runs the underlying query and shows the latest data.

---

## 🏗️ Why use VIEW?

Views are used to:

- Simplify complex queries
- Hide sensitive columns (security)
- Reuse SQL logic
- Provide abstraction layer
- Show only required data to users

Example:
Instead of writing a complex JOIN every time, create a view once and reuse it.

---

## 🧾 Basic Syntax

```
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
```

---

## 🧪 Example with your employee tables

Create a view showing employee + department:

```
CREATE VIEW emp_dept_view AS
SELECT e.emp_id, e.name, e.salary, d.dept_name, d.location
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

Use it like a table:

```
SELECT * FROM emp_dept_view;
```

---

## ✏️ Update a VIEW

If you want to modify a view:

```
CREATE OR REPLACE VIEW emp_dept_view AS
SELECT name, salary
FROM employees;
```

This replaces the existing view.

---

## ❌ Delete a VIEW

```
DROP VIEW emp_dept_view;
```

---

## 🔐 Advantages of VIEW

### 1. Security

Hide sensitive columns:

```
CREATE VIEW emp_public AS
SELECT name, dept_id
FROM employees;
```

Users cannot see salary.

---

### 2. Simplifies complex queries

Instead of writing joins again and again:

```
SELECT * FROM emp_dept_view WHERE salary > 60000;
```

---

### 3. Data abstraction

If table structure changes, view can stay same.

---

### 4. Reusability

Used in dashboards, reports, analytics.

---

## ⚠️ Limitations of VIEW

- Views do not store data (except materialized views)
- Complex views can be slow
- Some views are not updatable
- Cannot always insert/update through view

---

## 🧠 Types of Views

### 1. Simple View

Based on one table.

```
CREATE VIEW emp_names AS
SELECT name FROM employees;
```

### 2. Complex View

Multiple tables, joins, group by.

```
CREATE VIEW dept_salary AS
SELECT dept_id, AVG(salary) avg_salary
FROM employees
GROUP BY dept_id;
```

### 3. Materialized View (PostgreSQL advanced)

Stores data physically for fast access.

```
CREATE MATERIALIZED VIEW mv_emp AS
SELECT * FROM employees;
```

Refresh:

```
REFRESH MATERIALIZED VIEW mv_emp;
```

---

## 🔥 Real-world usage

### Dashboard queries

Create view for reporting:

```
CREATE VIEW company_dashboard AS
SELECT d.dept_name,
       COUNT(e.emp_id) total_emp,
       AVG(e.salary) avg_salary
FROM departments d
LEFT JOIN employees e ON d.dept_id=e.dept_id
GROUP BY d.dept_name;
```

Then:

```
SELECT * FROM company_dashboard;
```

---

## 🏆 Interview Questions on VIEW

**Q1:** Does view store data?
→ No (except materialized view)

**Q2:** Can we update view?
→ Yes, simple views only

**Q3:** Difference between table and view?
→ Table stores data, view stores query

**Q4:** What is materialized view?
→ Stores result physically

---

## 🧪 Practice Tasks

1. Create view for employees with salary > 60000
2. Create view showing employee + department
3. Create view for avg salary per department
4. Drop a view
5. Replace existing view

---

## 🎯 Summary

A VIEW is:

- virtual table
- saved SQL query
- used for security + simplicity
- heavily used in real companies

---

## 🚀 Next Topic Suggestions

After VIEW, learn:

- Index
- CTE
- Window functions
- Stored procedures
- Query optimization

These make you strong in SQL interviews.

## Notes

- Delete works only if view is based on single table.
- If views are based on joins and multiple table data in that case data updation will not work.
