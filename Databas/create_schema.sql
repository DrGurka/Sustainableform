use Sustainableform;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Types;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS Answers;

CREATE TABLE Types (
  ID int NOT NULL,
  Industry VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Users (
  ID int NOT NULL AUTO_INCREMENT,
  Email varchar(45) NOT NULL,
  Name varchar (45) NOT NULL,
  Type_ID int NOT NULL,
  Submitted tinyint DEFAULT NULL,
  PRIMARY KEY (Email),
  KEY type_idx (Type_ID),
  FOREIGN KEY (Type_ID) REFERENCES Types (ID)
);

CREATE TABLE Questions (
  ID int NOT NULL AUTO_INCREMENT,
  Type_ID int NOT NULL,
  Question_text longtext NOT NULL,
  Industry_ID int NOT NULL,
  PRIMARY KEY (ID),
  KEY type_idx (Type_ID)
  KEY industry_idx (Industry_ID),
  CONSTRAINT Answer_Constraint FOREIGN KEY (Type_ID) REFERENCES Answer_Types (ID),
  CONSTRAINT Industry_Constraint FOREIGN KEY (Industry_ID) REFERENCES Types (ID)
);


CREATE TABLE Answers (
  ID int NOT NULL AUTO_INCREMENT,
  Answer varchar(45) NOT NULL,
  Question_ID int NOT NULL,
  User_ID int NOT NULL,
  PRIMARY KEY (ID),
  KEY Question_idx (Question_ID),
  KEY User_idx (User_id),
  CONSTRAINT Question_Constraint FOREIGN KEY (Question_ID) REFERENCES Questions (ID), 
  CONSTRAINT User_Constraint FOREIGN KEY (User_ID) REFERENCES Users (ID),
  CONSTRAINT Unique_idx UNIQUE(Question_ID, User_ID)
);

CREATE TABLE Conditions (
  Question_ID int NOT NULL,
  Button_ID int NOT NULL,
  Next_ID int NOT NULL,
  KEY question_idx (Question_ID),
  KEY button_idx (Button_ID),
  KEY next_idx (Next_ID),
  CONSTRAINT Question FOREIGN KEY (Question_ID) REFERENCES Questions (ID),
  CONSTRAINT Button FOREIGN KEY (Button_ID) REFERENCES Answer_Types (ID),
  CONSTRAINT Next_Question FOREIGN KEY (Next_ID) REFERENCES Questions (ID)
);

CREATE TABLE Answer_Types (
  ID int NOT NULL AUTO_INCREMENT,
  Button_Text varchar(45) NOT NULL,
  Type_ID int NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Admins (
  ID int NOT NULL AUTO_INCREMENT,
  Username VARCHAR(45) NOT NULL,
  Password VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID)
);

SET FOREIGN_KEY_CHECKS = 1;


