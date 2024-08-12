SELECT 
    trainers.name, 
    trainers.email, 
    trainers.specialization,
    schedule.class_name, 
    schedule.class_date, 
    schedule.class_time 
FROM 
    trainers 
JOIN 
    schedule ON trainers.trainer_id = schedule.trainer_id
WHERE 
    trainers.trainer_id = 2; 
