CREATE TABLE teacher
(
    id   SERIAL  NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT teacher_pk PRIMARY KEY (id)
);

CREATE TABLE student
(
    id   SERIAL  NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE course
(
    id   SERIAL  NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (id)
);

CREATE TABLE class
(
    id         SERIAL  NOT NULL,
    name       VARCHAR NOT NULL,
    datetime   VARCHAR NOT NULL,
    teacher_id INT     NOT NULL REFERENCES teacher (id) ON UPDATE CASCADE ON DELETE CASCADE,
    course_id  INT     NOT NULL REFERENCES course (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT class_pk PRIMARY KEY (id)
);

CREATE TABLE enrolled
(
    id         SERIAL NOT NULL,
    student_id INT    NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    course_id  INT    NOT NULL REFERENCES course (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT enrolled_pk PRIMARY KEY (id)
);

CREATE TABLE grade
(
    id         SERIAL NOT NULL,
    grade      INT NOT NULL DEFAULT 0,
    attended   BOOLEAN NOT NULL DEFAULT FALSE,
    class_id   INT NOT NULL REFERENCES class (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_id INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT grade_pk PRIMARY KEY (id)
);