INSERT INTO student_groups
VALUES (1,'AC-47'),
       (2,'AC-48'),
       (3,'TB-11'),
       (4,'TB-12');

INSERT INTO users
VALUES (1, 'serge', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true , 'siarhei','yermakovich'),
       (2, 'yermakovich', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'marcel','lochka'),
       (3, 'apollo', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'ivan','petrov'),
       (4, 'apollo2', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'ivan','ivanov'),
       (5, 'creed', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'chala','houglu'),

       (6, 'stud1', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'oxana','livanova'),
       (7, 'stud2', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'petr','petrov'),
       (8, 'stud3', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'ivan','reivanov'),
       (9, 'stud4', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', true, 'sergei','guts');


INSERT INTO roles
VALUES (1, 'ROLE_STUDENT');
INSERT INTO roles
VALUES (2, 'ROLE_TEACHER');
INSERT INTO roles
VALUES (3, 'ROLE_ADMIN');

INSERT INTO user_role
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 3),
       (6, 1),
       (7, 1),
       (8, 1),
       (9, 1);

INSERT INTO teachers
VALUES (1, 3, 'high'),
       (2, 4, 'high');

INSERT INTO admins
VALUES (1, 5, 'absolute');

INSERT INTO students
VALUES (1, 1, 1,'Brest,Lenina 23','belarus'),
       (2, 2, 1,'Brest,Res 13','belarus'),
       (3, 6, 2,'Grodno,Reino 32','belarus'),
       (4, 7, 2,'Gomel,Tes 87','belarus'),
       (5, 8, 3,'Minsk,Komsom 44','belarus'),
       (6, 9, 4,'Saratov,Guty 32e','russia');

INSERT INTO courses
VALUES (1,1,'Math for AC','course related to AC-47 and 48'),
       (2,1,'Phys for AC','course related to AC-47 and 48'),
       (3,2,'C++ for TB','course related to TB');

INSERT INTO news
VALUES (1,1,'Math for AC','canceled 12/12/2019' , '2019-12-11 21:29:43'),
       (2,1,'Phys for AC','homework is unnecessary','2020-01-13 17:29:05'),
       (3,2,'Math for AC','canceled - 02/01/2020','2020-01-01 22:34:05'),
       (4,2,'Math for AC','canceled - 09/01/2020', '2020-01-05 23:29:11');

INSERT INTO course_group
VALUES (1, 1),
       (2, 1),
       (1, 2),
       (2, 2),
       (3,3),
       (3,4);
