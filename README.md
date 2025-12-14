# Task 3 - SQL for Data Analysis (Sample Submission)

This sample repository contains:
- `queries.sql` : SQL schema, sample data inserts, and example queries demonstrating SELECT, WHERE, GROUP BY, JOINs, subqueries, views, and indexes.
- `ecommerce_dataset.csv` : small sample customers table CSV for quick import.
- `screenshots/` : sample screenshots placeholders (PNG files).
- `task3.zip` : package of all files (this zip).

## How to run (SQLite example)
1. Install SQLite (if not available).
2. Create a database and import the SQL:
   ```bash
   sqlite3 task3.db < queries.sql
   ```
3. To inspect the data:
   ```sql
   SELECT * FROM customers;
   SELECT * FROM orders;
   ```
4. Run the example queries inside `queries.sql` (they are included as comments and runnable statements).

## Deliverables for submission
- `queries.sql` containing your SQL queries (provided).
- Screenshots of query outputs (sample placeholders included).
- A short README explaining what you did (this file).

Source: Task description from the provided PDF (see page 1 & 2). fileciteturn0file0
