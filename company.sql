CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE EMPLOYEE (
  ssn VARCHAR(35) PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  address VARCHAR(255) NOT NULL,
  sex VARCHAR(7) NOT NULL,
  salary INT NOT NULL,
  super_ssn VARCHAR(35),
  D_no INT,
  FOREIGN KEY (super_ssn) REFERENCES EMPLOYEE (ssn) ON DELETE SET NULL
);

CREATE TABLE DEPARTMENT (
  d_no INT PRIMARY KEY,
  dname VARCHAR(100) NOT NULL,
  mgr_ssn VARCHAR(35),
  mgr_start_date DATE,
  FOREIGN KEY (mgr_ssn) REFERENCES EMPLOYEE (ssn) ON DELETE CASCADE
);

 CREATE TABLE DLOCATION (
  d_no INT NOT NULL,
  d_loc VARCHAR(100) NOT NULL,
  FOREIGN KEY (d_no) REFERENCES DEPARTMENT (d_no) ON DELETE CASCADE
);

 CREATE TABLE PROJECT (
  p_no INT PRIMARY KEY,
  pname VARCHAR(25) NOT NULL,
  p_loc VARCHAR(25) NOT NULL,
  d_no INT NOT NULL,
  FOREIGN KEY (d_no) REFERENCES DEPARTMENT (d_no) ON DELETE CASCADE
);

CREATE TABLE WORKSON (
  ssn VARCHAR(35) NOT NULL,
  p_no INT NOT NULL,
  hours INT NOT NULL DEFAULT 0,
  FOREIGN KEY (ssn) REFERENCES EMPLOYEE (ssn) ON DELETE CASCADE,
  FOREIGN KEY (p_no) REFERENCES PROJECT (p_no) ON DELETE CASCADE
);

INSERT INTO EMPLOYEE VALUES
  ("01NB235", "Chandan_Krishna","Siddartha Nagar, Mysuru", "Male", 1500000, "01NB235", 5),
  ("01NB354", "Ram", "Lakshmipuram, Mysuru", "Female", 1200000,"01NB235", 2),
  ("02NB254", "Nitya", "Pune, Maharashtra", "Male", 1000000,"01NB235", 4),
  ("03NB653", "David", "Hyderabad, Telangana", "Male", 2500000, "01NB354", 5),
  ("04NB234", "Joel", "JP Nagar, Bengaluru", "Female", 1700000, "01NB354", 1);

 INSERT INTO DEPARTMENT VALUES
  (001, "Human Resources", "01NB235", "2020-10-21"),
  (002, "Quality Assesment", "03NB653", "2020-10-19"),
  (003,"System assesment","04NB234","2020-10-27"),
  (005,"Production","02NB254","2020-08-16"),
  (004,"Accounts","01NB354","2020-09-4");

 INSERT INTO DLOCATION VALUES
  (001, "Jaynagar, Bengaluru"),
  (002, "Vijaynagar, Mysuru"),
  (003, "Chennai, Tamil Nadu"),
  (004, "Mumbai, Maharashtra"),
  (005, "Kuvempunagar, Mysuru");

 INSERT INTO PROJECT VALUES
  (241563, "System Testing", "Mumbai, Maharashtra", 004),
  (532678, "IOT", "JP Nagar, Bengaluru", 001),
  (453723, "Product Optimization", "Hyderabad, Telangana", 005),
  (278345, "Yeild Increase", "Kuvempunagar, Mysuru", 005),
  (426784, "Product Refinement", "Saraswatipuram, Mysuru", 002);

INSERT INTO WORKSON VALUES
  ("01NB235", 278345, 5),
  ("01NB354", 426784, 6),
  ("04NB234", 532678, 3),
  ("02NB254", 241563, 3),
  ("03NB653", 453723, 6);

