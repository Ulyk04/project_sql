# Project in PostgreSQL

## Gym Management

### ABOUT

Description: Create a database to manage your gym membership. The database should have tables for clients, memberships, trainers and class schedules.

Requirements:

    Members table with columns: member_id, name, email, phone, membership_start_date.
    Subscriptions table with columns: subscription_id, subscription_name, price, duration_days.
    Trainers table with columns: trainer_id, name, specialization, email.
    Schedule table with columns: class_id, trainer_id, member_id, class_date, class_time, class_name.
Functionality:

    Adding new members and subscriptions.
    Register members for classes.
    Request a schedule for a specific member or coach.
    Request to retrieve all members with an active subscription.

### Files

- **main.sql**: This file contains and tests all the necessary SQL commands.
- **step.sql**: This file outlines the correct SQL commands that were used.

