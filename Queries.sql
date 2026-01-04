-- 1. Total employees
SELECT COUNT(*) AS total_employees FROM employees;

-- 2. Employees present today
SELECT e.employee_name, a.attendance_date
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Present';

-- 3. Attendance summary by department
SELECT e.department, COUNT(*) AS present_count
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Present'
GROUP BY e.department;

-- 4. Employees absent
SELECT e.employee_name
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Absent';

-- 5. Late check-in employees
SELECT e.employee_name, a.check_in
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.check_in > '09:15';

-- 6. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 7. Employee attendance count
SELECT employee_id, COUNT(*) AS days_recorded
FROM attendance
GROUP BY employee_id;

-- 8. Highest paid employee
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 9. Employees on leave
SELECT e.employee_name
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.status = 'Leave';

-- 10. Attendance with employee details
SELECT e.employee_name, e.department, a.attendance_date, a.status
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id;
-- 11. List all employees with department and designation
SELECT employee_name, department, designation
FROM employees;

-- 12. Employees earning more than 60,000
SELECT employee_name, salary
FROM employees
WHERE salary > 60000;

-- 13. Employees joined after 2022
SELECT employee_name, joining_date
FROM employees
WHERE joining_date > '2022-01-01';

-- 14. Total employees per department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 15. Departments with more than 5 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- 16. Total present days per employee
SELECT employee_id, COUNT(*) AS present_days
FROM attendance
WHERE status = 'Present'
GROUP BY employee_id;

-- 17. Total absent days per employee
SELECT employee_id, COUNT(*) AS absent_days
FROM attendance
WHERE status = 'Absent'
GROUP BY employee_id;

-- 18. Employees present more than 20 days
SELECT employee_id, COUNT(*) AS present_days
FROM attendance
WHERE status = 'Present'
GROUP BY employee_id
HAVING COUNT(*) > 20;

-- 19. Attendance summary by date
SELECT attendance_date, COUNT(*) AS total_records
FROM attendance
GROUP BY attendance_date;

-- 20. Late check-ins count per employee
SELECT employee_id, COUNT(*) AS late_days
FROM attendance
WHERE check_in > '09:15'
GROUP BY employee_id;

-- 21. Employees who never came late
SELECT e.employee_name
FROM employees e
WHERE e.employee_id NOT IN (
    SELECT employee_id
    FROM attendance
    WHERE check_in > '09:15'
);

-- 22. Employees with both Present and Absent records
SELECT employee_id
FROM attendance
GROUP BY employee_id
HAVING COUNT(DISTINCT status) > 1;

- 23. Maximum salary by department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

-- 24. Minimum salary by department
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- 25. Employees earning above department average
SELECT e.employee_name, e.salary, e.department
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- 26. Top 3 highest paid employees
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 27. Total salary expense by department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 28. Rank employees by salary within department
SELECT employee_name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 29. Row number for attendance records per employee
SELECT employee_id, attendance_date,
ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY attendance_date) AS row_num
FROM attendance;

-- 30. Highest salary employee in each department
SELECT employee_name, department, salary
FROM (
    SELECT employee_name, department, salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 1;

-- 31. Attendance running count per employee
SELECT employee_id, attendance_date,
COUNT(*) OVER (PARTITION BY employee_id ORDER BY attendance_date) AS running_days
FROM attendance;

-- 32. Salary comparison with department average
SELECT employee_name, department, salary,
AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;
🔹 REAL HR BUSINESS QUESTIONS (33–35)
sql
Copy code
-- 33. Employees with no attendance records
SELECT e.employee_name
FROM employees e
LEFT JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.employee_id IS NULL;

-- 34. Employees with most absences
SELECT employee_id, COUNT(*) AS absent_days
FROM attendance
WHERE status = 'Absent'
GROUP BY employee_id
ORDER BY absent_days DESC;

-- 35. Department-wise attendance count
SELECT e.department, COUNT(*) AS attendance_records
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
GROUP BY e.department;












