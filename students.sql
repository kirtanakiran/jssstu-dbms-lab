CREATE DATABASE STUDENTS;
USE STUDENTS;

CREATE TABLE STUDENT (
  regno VARCHAR(15) PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  major VARCHAR(25) NOT NULL,
  bdate DATE NOT NULL
);

CREATE TABLE COURSE (
  course_id INT PRIMARY KEY,
  cname VARCHAR(40) NOT NULL,
  dept VARCHAR(150) NOT NULL
);

CREATE TABLE ENROLL (
  regno VARCHAR(13),
  course_id INT,
  sem INT NOT NULL,
  marks INT NOT NULL,
  FOREIGN KEY (regno) REFERENCES STUDENT (regno) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES COURSE (course_id) ON DELETE CASCADE
);

CREATE TABLE BOOKADOPTION (
  course_id INT NOT NULL,
  Sem INT NOT NULL,
  bookisbn INT NOT NULL,
  FOREIGN KEY (course_id) REFERENCES COURSE (course_id) ON DELETE CASCADE,
  FOREIGN KEY (bookisbn) REFERENCES TEXTBOOK (bookisbn) ON DELETE CASCADE
);


INSERT INTO STUDENT VALUES
  ("01HF235", "Anil", "CSE", "2001-05-15"),
  ("01HF354", "Sahana", "Literature", "2002-06-10"),
  ("01HF254", "Catherine", "Philosophy", "2000-04-04"),
  ("01HF653", "Booby", "History", "2003-10-12"),
  ("01HF234", "Harish", "Computer Economics", "2001-10-10");

INSERT INTO COURSE VALUES
  (001, "DBMS", "CS"),
  (002, "Literature", "English"),
  (003, "Philosophy", "Philosphy"),
  (004, "History", "Social Science"),
  (005, "Computer Economics", "CS");

 INSERT INTO ENROLL VALUES
    ("01HF235", 001, 5, 85),
    ("01HF354", 002, 6, 87),
    ("01HF254", 003, 3, 95),
    ("01HF653", 004, 3, 80),
    ("01HF234", 005, 5, 75);

INSERT INTO TEXTBOOK VALUES
  (241563, "Operating Systems", "Pearson", "Silberschatz"),
  (532678, "Complete Works of Shakesphere", "Oxford", "Shakesphere"),
  (453723, "Immanuel Kant", "Delphi Classics", "Immanuel Kant"),
  (278345, "History of the world", "The Times", "Richard Overy"),
  (426784, "Behavioural Economics", "Pearson", "David Orrel");

INSERT INTO BOOKADOPTION VALUES
 (001, 5, 241563),
 (002, 6, 532678),
 (003, 3, 453723),
 (004, 3, 278345),
 (005, 6, 426784);



