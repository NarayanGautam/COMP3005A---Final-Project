-- 1. Inserting data into Members table
insert into Members(firstName, lastName, email, hashedPassword, loyaltyPoints) 
values ('John', 'Doe', 'john.doe@example.com', 'hashedpassword1', 100),
       ('Alice', 'Smith', 'alice.smith@example.com', 'hashedpassword2', 200),
       ('Bob', 'Johnson', 'bob.johnson@example.com', 'hashedpassword3', 150);

-- 2. select all members who have more than 150 loyalty points
select * from Members 
where loyaltyPoints > 150;

-- 3. update the password of member with memberID = 1 
update Members
set hashedPassword = 'abc123'
where memberID = 1;

-- 4. Inserting data into Trainers
insert into Trainers(firstName, lastName, email, hashedPassword, certification) 
values ('Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword', 'Certified Personal Trainer');

-- 5. Inserting data into PersonalTrainingSession
insert into PersonalTrainingSession(memberID, trainerID, sessionDate, sessionTime, sessionDuration, trainingActivity, roomLocation) 
values (1, 1, '2022-01-04', '11:00:00', 60, 'Strength Training', 'Room 2');

-- 6. Get the session date, location and member name for a trainer named Jane Smith
select sessionDate, roomLocation, m.firstName, m.lastName
from PersonalTrainingSession p
inner join Members m on p.memberID = m.memberID
inner join Trainers t on p.trainerID = t.trainerID
where t.firstName = 'Jane' and t.lastName = 'Smith';

-- 7. Inserting fitness goals data
insert into FitnessGoals(memberID, goalName, completionDate, goalDescription, goalStatus) 
values (1, 'Lose Weight', '2023-12-31', 'Lose 10kg by end of year', 'In Progress');

-- 8. Update the goal status of member with memberID = 1
update FitnessGoals
set goalStatus = 'Completed'
where memberID = 1;

-- 9. Inserting data into HealthMetrics
insert into HealthMetrics(memberID, recordDate, weight, height, bodyFat, caloricIntake) 
values (1, '2023-01-01', 80, 180, 20, 2500),
       (2, '2022-01-01', 60, 160, 15, 2000),
       (3, '2021-01-01', 70, 170, 18, 2200);

-- 10. Get the average weight and height of all members
select avg(weight), avg(height)
from HealthMetrics;

-- 11. Inserting data into AdministrativeStaff
insert into AdministrativeStaff(firstName, lastName, email, hashedPassword, position) 
values ('Rob', 'Johnson', 'rob.johnson@example.com', 'hashedpassword69', 'Manager');

-- 12. Get all managers
select * from AdministrativeStaff
where position = 'Manager';

-- 13. Inserting data into Billing
insert into Billing(memberID, staffID, billingDate, billDescription, amount, paymentStatus, pointsEarned) 
values (1, 1, '2023-01-01', 'Monthly Membership Fee', 50, 'Paid', 10);

-- 14. Get the billing details of member named John Doe
select * from Billing b
inner join Members m on b.memberID = m.memberID
where m.firstName = 'John' and m.lastName = 'Doe';

-- 15. Count the number of members who have paid their bills
select count(*) from Billing
where paymentStatus = 'Paid';

-- 16. Adding a FitnessClass 
INSERT INTO FitnessClass(trainerID, classDate, classTime, duration, fitnessType, roomLocation) 
VALUES (1, '2022-01-03', '10:00:00', 60, 'Yoga', 'Room 1');

-- 17. Add all members to the fitness class
INSERT INTO MembersFitnessClass(memberID, classID)
SELECT memberID, 1
FROM Members;

-- 18. Get the number of members in the fitness class
SELECT count(*) FROM MembersFitnessClass
WHERE classID = 1;



