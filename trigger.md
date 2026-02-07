# 📘 SQL Trigger — Complete Guide

## 🧠 What is a Trigger?

A **trigger** is a special type of stored procedure in SQL that automatically runs when a specific event occurs on a table.

It executes **automatically** when:

- INSERT happens
- UPDATE happens
- DELETE happens

You do not manually call a trigger.
Database calls it automatically.

> Trigger = automatic action when table changes.

---

## 🏗️ Why Triggers Are Used?

Triggers are used for:

- Audit logs (who changed data)
- Validation rules
- Automatic updates
- Prevent invalid operations
- Maintain history tables
- Security checks

Real example:
When salary updates → store old salary in history table.

---

## 📌 Types of Triggers

### 1. BEFORE Trigger

Runs before insert/update/delete.

Used for:

- validation
- modifying data before save

Example:

```
BEFORE INSERT
```

---

### 2. AFTER Trigger

Runs after operation completes.

Used for:

- logging
- history storage
- audit tracking

Example:

```
AFTER UPDATE
```

---

### 3. INSTEAD OF Trigger (advanced)

Used mostly on views.
Runs instead of actual query.

---

## 🧾 Trigger Syntax (PostgreSQL)

### Step 1 — Create function

Trigger always calls a function.

```
CREATE OR REPLACE FUNCTION function_name()
RETURNS trigger AS $$
BEGIN

   -- logic here

   RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

---

### Step 2 — Create trigger

```
CREATE TRIGGER trigger_name
BEFORE INSERT OR UPDATE OR DELETE
ON table_name
FOR EACH ROW
EXECUTE FUNCTION function_name();
```

---

# 🧪 Example 1 — Audit log for salary change

## Create history table

```
CREATE TABLE salary_audit (
    emp_id INT,
    old_salary INT,
    new_salary INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Create function

```
CREATE OR REPLACE FUNCTION salary_update_trigger()
RETURNS trigger AS $$
BEGIN
   INSERT INTO salary_audit(emp_id, old_salary, new_salary)
   VALUES (OLD.emp_id, OLD.salary, NEW.salary);

   RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

## Create trigger

```
CREATE TRIGGER trg_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
WHEN (OLD.salary IS DISTINCT FROM NEW.salary)
EXECUTE FUNCTION salary_update_trigger();
```

Now whenever salary changes → log saved automatically.

---

# 🧪 Example 2 — Prevent negative salary

```
CREATE OR REPLACE FUNCTION check_salary()
RETURNS trigger AS $$
BEGIN
   IF NEW.salary < 0 THEN
      RAISE EXCEPTION 'Salary cannot be negative';
   END IF;

   RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

Create trigger:

```
CREATE TRIGGER trg_check_salary
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION check_salary();
```

Now negative salary cannot be inserted.

---

# 🧠 OLD vs NEW keywords

Inside triggers:

| Keyword | Meaning               |
| ------- | --------------------- |
| OLD     | old row before change |
| NEW     | new row after change  |

Example:

```
OLD.salary
NEW.salary
```

---

# 🏆 Real-world uses

Triggers used in:

- Banking systems
- Audit logs
- E-commerce orders
- Data validation
- Security tracking
- History tracking

Almost every production DB uses triggers.

---

# ⚠️ Disadvantages

- Hard to debug
- Hidden logic
- Can slow inserts/updates
- Overuse makes DB complex

Use wisely.

---

# 🧪 Practice Tasks

1. Create trigger to log deleted employees
2. Prevent salary < 10000
3. Store employee update history
4. Count total inserts
5. Audit login table

---

# 🧠 Interview Questions

**Q1: What is trigger?**
Auto-executed function when table changes.

**Q2: Types of triggers?**
BEFORE, AFTER, INSTEAD OF.

**Q3: OLD vs NEW?**
OLD = previous value
NEW = updated value

**Q4: Can trigger slow DB?**
Yes if heavy logic.

---

# 🎯 Summary

Trigger:

- automatic database action
- runs on insert/update/delete
- used for validation & audit
- powerful but must use carefully

Triggers make database smart and automated.
