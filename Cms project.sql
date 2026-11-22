create database cms;
use cms;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(100)
);
INSERT INTO Users VALUES
(1,'Aarav','900000001','u1@mail.com','Vijayawada'),
(2,'Bhavya','900000002','u2@mail.com','Hyderabad'),
(3,'Charan','900000003','u3@mail.com','Guntur'),
(4,'Divya','900000004','u4@mail.com','Vizag'),
(5,'Esha','900000005','u5@mail.com','Nellore'),
(6,'Farhan','900000006','u6@mail.com','Kurnool'),
(7,'Gopi','900000007','u7@mail.com','Tirupati'),
(8,'Hari','900000008','u8@mail.com','Ongole'),
(9,'Isha','900000009','u9@mail.com','Warangal'),
(10,'John','900000010','u10@mail.com','Chennai');

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO Departments VALUES (1,'IT'), (2,'HR'), (3,'Finance'), (4,'Network'), (5,'Adminstration');

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    employee_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
INSERT INTO Employees VALUES
(101,1,'Ravi','910000001','e1@mail.com'),
(102,1,'Priya','910000002','e2@mail.com'),
(103,2,'Kiran','910000003','e3@mail.com'),
(104,2,'Sneha','910000004','e4@mail.com'),
(105,3,'Arjun','910000005','e5@mail.com'),
(106,4,'Meena','910000006','e6@mail.com'),
(107,5,'Vikas','910000007','e7@mail.com'),
(108,1,'Divya','910000008','e8@mail.com');

CREATE TABLE Complaint_Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

INSERT INTO Complaint_Categories VALUES (1,'Software'), (2,'Hardware'), (3,'Network'), (4,'Login'), (5,'Security'), (6,'Other');

CREATE TABLE Complaints (
    complaint_id INT PRIMARY KEY,
    user_id INT,
    employee_id INT,
    category_id INT,
    complaint_date DATE,
    priority VARCHAR(20),
    status VARCHAR(20),
    description TEXT,

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id),

    FOREIGN KEY (category_id)
        REFERENCES Complaint_Categories(category_id)
);

INSERT INTO Complaints VALUES
(1001,1,101,4,'2026-07-01','High','Open','Unable to login to employee portal'),
(1002,1,102,1,'2026-07-02','Medium','Resolved','ERP application crashes frequently'),
(1003,2,103,3,'2026-07-02','High','In Progress', 'Office internet is not working'),
(1004,2,104,2,'2026-07-03','Low','Closed','Desktop not powering on'),
(1005,3,101,5,'2026-07-03','High','Resolved','Unauthorized login attempt detected'),
(1006,3,105,6,'2026-07-04','Medium','Open','Need access to shared folder'),
(1007,4,106,2,'2026-07-04','High','In Progress', 'Printer not detecting system'),
(1008,4,107,6,'2026-07-05','Low','Closed','Request for workstation relocation'),
(1009,5,108,1,'2026-07-05','Medium','Resolved','Payroll software not responding'),
(1010,5,103,3,'2026-07-06','High','Open','VPN connection failed'),
(1011,6,104,4,'2026-07-06','Medium','Resolved','Password reset email not received'),
(1012,6,105,5,'2026-07-07','High','Closed','Suspicious email reported'),
(1013,7,106,2,'2026-07-07','Low','Open','Keyboard keys are not working'),
(1014,7,101,1,'2026-07-08','Medium','In Progress', 'MS Excel keeps crashing'),
(1015,8,102,6,'2026-07-08','Low','Resolved','Need new software installation'),
(1016,8,107,3,'2026-07-09','High','Open','LAN cable disconnected'),
(1017,9,108,4,'2026-07-09','Medium','Closed','Unable to login after password change'),
(1018,9,103,5,'2026-07-10','High','Resolved','System blocked due to security policy'),
(1019,10,104,1,'2026-07-10','Low','In Progress', 'Application loading very slowly'),
(1020,10,105,6,'2026-07-11','Medium','Open','General technical assistance required');

#1.Display all complaints.
select*from complaints;
#2. Show complaint with user name.
SELECT c.complaint_id,u.full_name,c.complaint_date,c.priority,c.status, c.description
 FROM Complaints c JOIN Users u ON c.user_id = u.user_id;

#3. Display all employee names in uppercase and lowercase.
SELECT employee_name, UPPER(employee_name) AS uppercase_name, LOWER(employee_name) AS lowercase_name FROM Employees;

#4. Display the first 4 characters & last 5 characters of every complaint description.
SELECT description, LEFT(description, 4) AS first_4_characters,RIGHT(description, 5) AS last_5_characters
FROM Complaints;

#5. Concatenate employee name and department name with and without separator.
SELECT CONCAT(e.employee_name, d.department_name)AS without_separator,CONCAT(e.employee_name, ' - ', d.department_name)
AS with_separator FROM Employees e JOIN Departments d ON e.department_id = d.department_id;

#6. Replace the word "login" with "authentication" in complaint descriptions.
SELECT complaint_id, REPLACE(description, 'login', 'authentication')
AS updated_description FROM Complaints;

#7. Find complaints raised in the last 7 days.
SELECT *FROM Complaints WHERE complaint_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
AND complaint_date <= CURDATE();

#8. Count complaints raised department-wise this month.
SELECT d.department_name,COUNT(c.complaint_id) AS total_complaints FROM Departments d 
JOIN Employees e ON d.department_id = e.department_id
JOIN Complaints c ON e.employee_id = c.employee_id
WHERE MONTH(c.complaint_date) = MONTH(CURDATE()) AND YEAR(c.complaint_date) = YEAR(CURDATE())
GROUP BY d.department_id, d.department_name;

#9.Display complaint dates in the format 08-Jul-2026
SELECT complaint_id,DATE_FORMAT(complaint_date, '%d-%b-%Y') AS formatted_date FROM Complaints;

#10. Show complaint with employee and department.
SELECT c.complaint_id,c.description,e.employee_name,d.department_name
FROM Complaints c JOIN Employees e ON c.employee_id = e.employee_id
JOIN Departments d ON e.department_id = d.department_id;

#11. Count complaints by status.
SELECT status,COUNT(*) AS total_complaints FROM Complaints GROUP BY status;

#12. Count complaints by priority.
SELECT priority,COUNT(*) AS total_complaints FROM Complaints GROUP BY priority;

#13: Find the department with maximum complaints
SELECT d.department_name,COUNT(c.complaint_id) AS total_complaints FROM Departments d
JOIN Employees e ON d.department_id = e.department_id JOIN Complaints c ON e.employee_id = c.employee_id 
GROUP BY d.department_id, d.department_name ORDER BY total_complaints DESC LIMIT 1;

#14. Employee handling maximum complaints.
SELECT e.employee_id,e.employee_name,COUNT(c.complaint_id) AS total_complaints FROM Employees e 
JOIN Complaints c ON e.employee_id = c.employee_id GROUP BY e.employee_id, e.employee_name 
ORDER BY total_complaints DESC LIMIT 1;

#15. Display open complaints
SELECT *FROM Complaints WHERE status = 'Open';

#16. Display resolved complaints
SELECT *FROM Complaints WHERE status = 'Resolved';

#17. Find complaints raised today
SELECT *FROM Complaints WHERE complaint_date = CURDATE();

#18. Find users with multiple complaints
SELECT u.user_id, u.full_name,COUNT(c.complaint_id) AS total_complaints FROM Users u
JOIN Complaints c ON u.user_id = c.user_id GROUP BY u.user_id, u.full_name HAVING COUNT(c.complaint_id) > 1;

#19. Find categories with more than one complaint
SELECT cc.category_name,COUNT(c.complaint_id) AS total_complaints FROM Complaint_Categories cc
JOIN Complaints c ON cc.category_id = c.category_id GROUP BY cc.category_id, cc.category_name
HAVING COUNT(c.complaint_id) > 1;

#20. Find average complaints per employee
SELECT AVG(total_complaints) AS average_complaints
FROM (SELECT e.employee_id,COUNT(c.complaint_id) AS total_complaints FROM Employees e LEFT JOIN Complaints c
ON e.employee_id = c.employee_id GROUP BY e.employee_id) AS employee_complaints;

#21. Display top 5 latest complaints
SELECT *FROM Complaints ORDER BY complaint_date DESC LIMIT 5;

#22. Find complaints assigned to IT department
SELECT c.*FROM Complaints c
JOIN Employees e ON c.employee_id = e.employee_id
JOIN Departments d ON e.department_id = d.department_id WHERE d.department_name = 'IT';

#23. Find users without complaints #o/p-empty rows
SELECT u.*FROM Users u
LEFT JOIN Complaints c ON u.user_id = c.user_id WHERE c.complaint_id IS NULL;

#24. Find employees without assigned complaints
SELECT e.*FROM Employees e
LEFT JOIN Complaints c ON e.employee_id = c.employee_id WHERE c.complaint_id is NULL;

#25. Display current status of complaints raised in the last 15 days
SELECT complaint_id, complaint_date, status FROM Complaints
WHERE complaint_date >= DATE_SUB(CURDATE(), INTERVAL 15 DAY) AND complaint_date <= CURDATE();

#26. Generate complaint reference using category name and complaint ID
SELECT c.complaint_id,cc.category_name,CONCAT(UPPER(cc.category_name), '-', c.complaint_id)AS complaint_reference
FROM Complaints c JOIN Complaint_Categories cc ON c.category_id = cc.category_id;

#27. Display employee name in uppercase with the number of complaints assigned.
SELECT UPPER(e.employee_name) AS employee_name,COUNT(c.complaint_id) AS total_complaints
FROM employees e LEFT JOIN complaints c ON e.employee_id = c.employee_id GROUP BY e.employee_id, e.employee_name;

#28. Display high-priority open complaints.
SELECT *FROM complaints WHERE priority = 'High' AND status = 'Open';

#29. Create a view for open complaints and retrieve data from it.
CREATE VIEW open_complaints AS SELECT * FROM complaints WHERE status = 'Open';
SELECT * FROM open_complaints;
#30. Transaction: assign employee then update status.
START TRANSACTION;

UPDATE complaints
SET employee_id = 102
WHERE complaint_id = 1001;

UPDATE complaints
SET status = 'In Progress'
WHERE complaint_id = 1001;

COMMIT;
SELECT complaint_id, user_id, employee_id,
       category_id, complaint_date, priority, status, description
FROM complaints
WHERE complaint_id = 1001;

#31. Create a stored procedure to display all complaints assigned to a particular employee.
#• Input: employee_id
#• Display complaint_id, priority, status, and description.
DELIMITER //
CREATE PROCEDURE employee_complaints(IN emp_id INT)
BEGIN
    SELECT complaint_id, priority, status, description
    FROM complaints
    WHERE employee_id = emp_id;
END //

DELIMITER ;
CALL employee_complaints(101);

#32. Create a stored procedure to display all complaints having a particular priority.
#• Input: priority
#• For example, display all High priority complaints.
DELIMITER //

CREATE PROCEDURE priority_complaints(IN p_priority VARCHAR(20))
BEGIN
    SELECT *
    FROM complaints
    WHERE priority = p_priority;
END //

DELIMITER ;
CALL priority_complaints('High');

#33. Create a stored procedure to count the number of complaints for a particular category.
#• Input: category_id
#• Display the total number of complaints.
DELIMITER //

CREATE PROCEDURE category_complaint_count(IN cat_id INT)
BEGIN
    SELECT COUNT(*) AS total_complaints
    FROM complaints
    WHERE category_id = cat_id;
END //

DELIMITER ;
CALL category_complaint_count(1);

#34. Create a trigger on the Complaints table.
#Whenever a new complaint is inserted, automatically store the complaint_id,
#user_id, category_id, and complaint date in a Complaint_Log table.
CREATE TABLE Complaint_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT,
    user_id INT,
    category_id INT,
    complaint_date DATE
);

DELIMITER //

CREATE TRIGGER after_complaint_insert
AFTER INSERT ON complaints
FOR EACH ROW
BEGIN
    INSERT INTO Complaint_Log
    (complaint_id, user_id, category_id, complaint_date)
    VALUES
    (NEW.complaint_id, NEW.user_id,
     NEW.category_id, NEW.complaint_date);
END //

DELIMITER ;
INSERT INTO Complaints
VALUES
(1021, 1, 101, 4, '2026-11-09',
 'High', 'Open', 'Unable to access the system');
SELECT * FROM Complaint_Log;

#35. Trigger to store complaint status changes in Complaint_Status_History.
CREATE TABLE Complaint_Status_History (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT,
    old_status VARCHAR(30),
    new_status VARCHAR(30),
    update_date DATETIME
);
use cms;

DELIMITER //

CREATE TRIGGER after_complaint_status_update
AFTER UPDATE ON complaints
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO Complaint_Status_History
        (complaint_id, old_status, new_status, update_date)
        VALUES
        (NEW.complaint_id, OLD.status,
         NEW.status, NOW());
    END IF;
END //

DELIMITER ;
SELECT * FROM Complaint_Status_History;
