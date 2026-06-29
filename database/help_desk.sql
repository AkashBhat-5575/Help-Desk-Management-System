DROP DATABASE IF EXISTS help_desk;
CREATE DATABASE help_desk;

USE help_desk;

CREATE TABLE user (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE ticket (
    ticketID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    issue VARCHAR(255) NOT NULL,
    assign_to INT,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (userID) REFERENCES user(userId)
);
