DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_name VARCHAR(255),
  age INT2
);

CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  house_name VARCHAR(255),
  url VARCHAR(255)
);
