-- Create the 'admin' table
CREATE TABLE admin (
    adminId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    adminName VARCHAR(255) NOT NULL,
    adminEmail VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phoneNumber BIGINT NOT NULL
);

-- Create the 'coursecatalog' table
CREATE TABLE coursecatalog (
    courseId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    courseName VARCHAR(255) NOT NULL,
    professorName VARCHAR(255) NOT NULL,
    prerequisites VARCHAR(255) NOT NULL
);

-- Create the 'gradecard' table
CREATE TABLE gradecard (
    studentId INT NOT NULL,
    courseId INT NOT NULL,
    grade VARCHAR(255) NOT NULL DEFAULT 'NA',
    PRIMARY KEY (studentId, courseId)
);

-- Create the 'notification' table
CREATE TABLE notification (
    notificationId INT NOT NULL PRIMARY KEY,
    notificationMessage VARCHAR(255) NOT NULL
);

-- Create the 'notificationstudentmapping' table
CREATE TABLE notificationstudentmapping (
    notifId INT NOT NULL,
    studentId INT NOT NULL,
    PRIMARY KEY (notifId, studentId)
);

-- Create the 'payment' table
CREATE TABLE payment (
    studentId INT NOT NULL PRIMARY KEY,
    paymentStatus INT NOT NULL,
    transactionId BIGINT NOT NULL,
    amount INT NOT NULL
);

-- Create the 'professor' table
CREATE TABLE professor (
    professorid INT NOT NULL PRIMARY KEY,
    professorname VARCHAR(255) NOT NULL,
    professoremail VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phonenumber BIGINT NOT NULL
);

-- Create the 'professorcoursemapping' table
CREATE TABLE professorcoursemapping (
    professorid INT NOT NULL,
    courseid INT NOT NULL,
    isApproved INT DEFAULT 0,
    PRIMARY KEY (professorid, courseid)
);

-- Create the 'student' table
CREATE TABLE student (
    studentid INT NOT NULL PRIMARY KEY,
    studentname VARCHAR(255) NOT NULL,
    studentemail VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phonenumber BIGINT NOT NULL,
    isapproved INT NOT NULL DEFAULT 0
);

-- Create the 'studentcoursemapping' table
CREATE TABLE studentcoursemapping (
    studentid INT NOT NULL,
    courseid INT NOT NULL,
    coursecategory INT NOT NULL,
    isRegister INT NOT NULL DEFAULT 0,
    PRIMARY KEY (studentid, courseid)
);

