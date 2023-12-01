use traveldb;

drop table user;

CREATE TABLE user (
    userEmail VARCHAR(255) NOT NULL,
    userPwd VARCHAR(255) NOT NULL,
    userNName VARCHAR(50),
    userEName VARCHAR(50),
    userNum VARCHAR(20),
    userCon VARCHAR(20),
    userBirth DATE,
    PRIMARY KEY (userEmail)
);

select * from user;