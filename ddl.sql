create table Members (
    memberID serial primary key,
    firstName varchar(255) not null,
    lastName varchar(255) not null,
    email varchar(255) unique not null,
    hashedPassword varchar(255) not null,
    loyaltyPoints int not null
);

create table HealthMetrics (
    memberID int not null,
    recordDate date not null default current_date,
    weight int not null,
    height int not null,
    bodyFat int not null,
    caloricIntake int not null,
    foreign key (memberID) references Members(memberID),
    primary key (memberID, recordDate)
);

create table ExerciseRoutines (
    memberID int not null,
    routineDate date not null default current_date,
    routineDuration int not null,
    routineType varchar(255) not null,
    foreign key (memberID) references Members(memberID),
    primary key (memberID, routineDate)
);

create table FitnessGoals (
    memberID int not null,
    goalName varchar(255) not null,
    completionDate date not null default current_date,
    goalDescription varchar(255) not null,
    goalStatus varchar(255) not null,
    foreign key (memberID) references Members(memberID),
    primary key (memberID, goalName)
);

create table Trainers (
    trainerID serial primary key,
    firstName varchar(255) not null,
    lastName varchar(255) not null,
    email varchar(255) unique not null,
    hashedPassword varchar(255) not null,
    certification varchar(255) not null
);

create table AdministrativeStaff (
    staffID serial primary key,
    firstName varchar(255) not null,
    lastName varchar(255) not null,
    email varchar(255) unique not null,
    hashedPassword varchar(255) not null,
    position varchar(255) not null
);

create table FitnessClass (
    classID serial primary key,
    trainerID int not null,
    classDate date not null default current_date,
    classTime time not null,
    duration int not null,
    fitnessType varchar(255) not null,
    roomLocation varchar(255) not null,
    foreign key (trainerID) references Trainers(trainerID)
);

create table RoomCapacity (
    roomLocation varchar(255) not null primary key,
    capacity int not null
);

create table MembersFitnessClass (
    memberID int not null,
    classID int not null,
    foreign key (memberID) references Members(memberID),
    foreign key (classID) references FitnessClass(classID),
    primary key (memberID, classID)
);

create table PersonalTrainingSession (
    memberID int not null,
    trainerID int not null,
    sessionDate date not null default current_date,
    sessionTime time not null,
    sessionDuration int not null,
    trainingActivity varchar(255) not null,
    roomLocation varchar(255) not null,
    foreign key (memberID) references Members(memberID),
    foreign key (trainerID) references Trainers(trainerID),
    primary key (memberID, trainerID, sessionDate)
);

create table Billing (
    transactionID serial primary key,
    memberID int not null,
    staffID int not null,
    billingDate date not null default current_date,
    billDescription varchar(255) not null,
    amount int not null,
    paymentStatus varchar(255) not null,
    pointsEarned int not null,
    foreign key (memberID) references Members(memberID),
    foreign key (staffID) references AdministrativeStaff(staffID)
);

create table Equipment (
    equipmentID serial primary key,
    equipmentName varchar(255) not null,
    equipmentType varchar(255) not null,
    equipmentLocation varchar(255) not null
);

create table EquipmentMaintenance (
    equipmentID int not null,
    staffID int not null,
    maintenanceDate date not null default current_date,
    maintenanceTime time not null,
    maintenanceDuration int not null,
    foreign key (equipmentID) references Equipment(equipmentID),
    primary key (equipmentID, staffID, maintenanceDate)
);







