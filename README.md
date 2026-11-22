Complaint Management System

1. Project Title
Complaint Management System using MySQL

2. Project Overview
The Complaint Management System is a database-based project developed using MySQL. It helps organizations manage user complaints in an organized way.

Users can raise complaints, employees can be assigned to handle them, and administrators can track complaint statuses such as Open, In Progress, and Resolved.

This system makes complaint management easier, faster, and more efficient.

3. Project Objectives
- To maintain user and employee details.
- To store and manage complaints.
- To assign complaints to employees and departments.
- To track complaint status.
- To generate useful reports using SQL queries.
- To reduce manual complaint management.

4. Features
- Store user information.
- Maintain employee details.
- Manage departments and complaint categories.
- Register and track complaints.
- Display open and resolved complaints.
- Find users with multiple complaints.
- Identify employees without assigned complaints.
- Generate complaint reports.
- Use SQL joins, views, stored procedures, and triggers.
- Generate unique complaint references.

5. Technologies Used
- Database: MySQL
- Query Language:SQL
- Concepts Used:
  - DDL (Data Definition Language)
  - DML (Data Manipulation Language)
  - DQL (Data Query Language)
  - Joins
  - Aggregate Functions
  - Subqueries
  - Views
  - Stored Procedures
  - Triggers

6. Installation and Setup Instructions

1. Install MySQL Server.
2. Install MySQL Workbench.
3. Open MySQL Workbench.
4. Connect to your MySQL server.
5. Create a database:

```sql
CREATE DATABASE Complaint_Management_System;
```

6. Select the database:

```sql
USE Complaint_Management_System;
```

7. Execute the SQL table creation scripts.
8. Insert the required sample records.
9. Execute the project queries.

7. How to Run the Project

1. Open MySQL Workbench.
2. Connect to the MySQL server.
3. Select the project database.
4. Execute the SQL scripts in the correct order.
5. Run the required queries to view complaint details and reports.
6. Check the output in the result grid.

8. Sample Output

Open Complaints

| Complaint ID | Status |
|---|---|
| 1001 | Open |
| 1002 | Open |

Resolved Complaints

| Complaint ID | Status |
|---|---|
| 1003 | Resolved |
| 1004 | Resolved |

Complaint Reference

| Complaint ID | Reference |
|---|---|
| 1001 | SOFTWARE-1001 |
| 1002 | HARDWARE-1002 |

9. Database Notes
The project uses the following main tables:

- Users
- Employees
- Departments
- Complaint_Categories
- Complaints

Relationships are maintained using Primary Keys and Foreign Keys.

SQL joins are used to retrieve related information from multiple tables.

Views, stored procedures, and triggers are used to simplify database operations and automate tasks.

10. Environment Variables
No environment variables are required for this project because it is directly executed using MySQL Workbench.

11. Team Members and Contributions

Team Member 1:
- Database design and table creation.
- Creating primary and foreign key relationships.
- Inserting sample records.
- Writing basic SQL queries.

Team Member 2:
- Writing advanced SQL queries.
- Implementing joins and subqueries.
- Creating views, stored procedures, and triggers.
- Testing queries and verifying outputs.

Both team members collaborated on project development, testing, and documentation.

12. Conclusion

The Complaint Management System provides an organized way to store, manage, assign, and track complaints using MySQL. This project helped us understand database management concepts and practical SQL operations.
