SELECT t.title , t.descriptions , t.due_date, statuses.status_name 
FROM tasks t
JOIN statuses ON t.status_id = statuses.status_id
WHERE t.assigned_to = 'Adem'