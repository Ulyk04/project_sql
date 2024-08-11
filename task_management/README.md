# Project in PostgreSQL

## Task Management System

### ABOUT

Description: Create a database to manage tasks in a team. The database should have tables for tasks, users, and task statuses.

Requirements:

    Table users with columns: user_id, name, email.
    Tasks table with columns: task_id, title, description, assigned_to, due_date, status_id.
    Table statuses with columns: status_id, status_name.

Functionality:

    Adding new tasks and assigning them to users.
    Changing the status of tasks (for example, “in progress”, “completed”).
    A request to retrieve all tasks assigned to a specific user.
    Request to receive all tasks with a certain status.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.

