WITH project_status AS (
    SELECT project_id, project_name, budget, 'Completed' AS status
    FROM completed_projects

    UNION ALL

    SELECT project_id, project_name, budget, 'Upcoming' AS status
    FROM upcoming_projects
)

SELECT
    d.department_name,
    e.employee_name,
    ps.project_name,
    ps.status,
    ps.budget
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
JOIN project_assignments pa
    ON e.employee_id = pa.employee_id
JOIN project_status ps
    ON pa.project_id = ps.project_id;
