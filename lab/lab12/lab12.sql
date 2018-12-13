.read fa17data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  SELECT seven, denero from students;

-- Q3
CREATE TABLE smallest_int AS
  SELECT time, smallest from students where smallest > 15 order by smallest limit 20;

-- Q4
CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color from students as a, students as b where a.pet = b.pet and a.song = b.song and a.time < b.time;
