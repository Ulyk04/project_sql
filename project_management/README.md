# Project in PostgreSQL

## Project management system 

### ABOUT

Description: Create a project management system for a company with a progress reporting function.

Requirements:

    Projects table with columns: project_id, project_name, start_date, end_date, status.
    Teams table with columns: team_id, team_name.
    Employees table with columns: employee_id, name, email, team_id.
    Tasks table with columns: task_id, project_id, assigned_to, task_description, start_date, due_date, status.
    Reports table with columns: report_id, project_id, report_date, progress_percent, comments.

Functionality:
    
    Assigning employees to teams and projects.
    Creating and updating tasks by projects.
    Generating progress reports by projects indicating the percentage of completion and comments.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.
