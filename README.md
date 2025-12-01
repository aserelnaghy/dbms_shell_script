# Bash Mini DBMS

A lightweight database management system implemented entirely using Bash scripts. This project simulates the core behaviour of a DBMS using plain text files with support for table creation, schema validation, primary keys, and CRUD operations.

---

## Features

### Table Operations
- Create tables with named columns, data types, and primary key flags.
- List existing tables.
- Drop/delete tables.

### Row Operations
- Insert new rows with type checking and primary key enforcement.
- Display table contents in a formatted layout.
- Update rows based on primary key lookup.
- Delete rows by primary key.

### Schema Format
Table schemas are stored in the first line of each table file using the format: