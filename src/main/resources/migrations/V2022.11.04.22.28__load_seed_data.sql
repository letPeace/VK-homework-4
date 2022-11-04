INSERT INTO teacher (name)
VALUES ('Teacher1'),
       ('Teacher2'),
       ('Teacher3');

INSERT INTO student (name)
VALUES ('Student1'),
       ('Student2'),
       ('Student3');

INSERT INTO course (name)
VALUES ('Course1'),
       ('Course2'),
       ('Course3');

INSERT INTO class (name, datetime, teacher_id, course_id)
SELECT 'Class1', '2022.11.01', teacher.id, course.id FROM teacher, course
WHERE teacher.name = 'Teacher1' AND course.name = 'Course1'
UNION
SELECT 'Class2', '2022.11.02', teacher.id, course.id FROM teacher, course
WHERE teacher.name = 'Teacher2' AND course.name = 'Course2'
UNION
SELECT 'Class3', '2022.11.03', teacher.id, course.id FROM teacher, course
WHERE teacher.name = 'Teacher3' AND course.name = 'Course3';

INSERT INTO enrolled (student_id, course_id)
SELECT student.id, course.id FROM student, course
WHERE student.name = 'Student1' AND course.name = 'Course1'
UNION
SELECT student.id, course.id FROM student, course
WHERE student.name = 'Student2' AND course.name = 'Course2'
UNION
SELECT student.id, course.id FROM student, course
WHERE student.name = 'Student3' AND course.name = 'Course3';

INSERT INTO grade (grade, attended, class_id, student_id)
SELECT 5, TRUE, class.id, student.id FROM class, student
WHERE class.name = 'Class1' AND student.name = 'Student1'
UNION
SELECT 4, TRUE, class.id, student.id FROM class, student
WHERE class.name = 'Class1' AND student.name = 'Student2'
UNION
SELECT 3, TRUE, class.id, student.id FROM class, student
WHERE class.name = 'Class2' AND student.name = 'Student1'
UNION
SELECT 2, FALSE, class.id, student.id FROM class, student
WHERE class.name = 'Class2' AND student.name = 'Student2'
UNION
SELECT 1, FALSE, class.id, student.id FROM class, student
WHERE class.name = 'Class3' AND student.name = 'Student2'
UNION
SELECT 0, FALSE, class.id, student.id FROM class, student
WHERE class.name = 'Class3' AND student.name = 'Student3';
