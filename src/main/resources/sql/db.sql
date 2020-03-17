CREATE SCHEMA IF NOT EXISTS `dplm` DEFAULT CHARACTER SET utf8;
USE dplm;

CREATE TABLE IF NOT EXISTS student_groups
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS users
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    active   BOOLEAN      NOT NULL,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS roles
(
    id        INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS user_role
(
    user_id INT NOT NULL,
    role_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (role_id) REFERENCES roles (id),

    UNIQUE (user_id, role_id)
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS teachers
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category VARCHAR(255) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id)
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS admins
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    status VARCHAR(255) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id)
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS students
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    student_group_id INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    nationality VARCHAR(255) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (student_group_id) REFERENCES student_groups (id)
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS messages
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    from_id INT NOT NULL,
    to_id INT NOT NULL,
    text VARCHAR(255) NOT NULL,
    date        DATETIME     NOT NULL,

    FOREIGN KEY (from_id) REFERENCES users (id),
    FOREIGN KEY (to_id) REFERENCES users (id)
)
    ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS courses
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
	teacher_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,

    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS news
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
	course_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    date        DATETIME     NOT NULL,

    FOREIGN KEY (course_id) REFERENCES courses (id)
)
    ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS course_group
(
    course_id INT NOT NULL,
    group_id INT NOT NULL,

    FOREIGN KEY (course_id) REFERENCES courses (id),
    FOREIGN KEY (group_id) REFERENCES student_groups (id),

    UNIQUE (course_id, group_id)
)
    ENGINE = InnoDB;


 CREATE TABLE IF NOT EXISTS files
(
    id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    file_directory VARCHAR(255) NOT NULL,
    file_name VARCHAR(255) NOT NULL

)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS labs
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lab_description VARCHAR(100) NOT NULL,
    lab_status VARCHAR(100) NOT NULL,
    lab_order  INT          NOT NULL,
    student_id    INT          NOT NULL,
    course_id  INT          NOT NULL,
    doc_id     INT          NOT NULL,
    report_id  INT          NOT NULL,

    CONSTRAINT lab_student_id_fk FOREIGN KEY (student_id) REFERENCES students (id)     ON UPDATE CASCADE,
    CONSTRAINT lab_course_id_fk FOREIGN KEY (course_id) REFERENCES courses (id)     ON UPDATE CASCADE,
    CONSTRAINT lab_doc_id_fk FOREIGN KEY (doc_id) REFERENCES files (id)     ON UPDATE CASCADE,
    CONSTRAINT lab_report_id_fk FOREIGN KEY (report_id) REFERENCES files (id)     ON UPDATE CASCADE
)
    ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS lab_comments
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    date        DATETIME     NOT NULL,
    teacher_id     INT          NOT NULL,
    lab_id     INT          NOT NULL,
    CONSTRAINT comment_lab_id_fk FOREIGN KEY (lab_id) REFERENCES labs (id),
    CONSTRAINT comment_teacher_id_fk FOREIGN KEY (teacher_id) REFERENCES teachers (id)
)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS notifications
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    notification_message VARCHAR(100) NOT NULL,
    user_id     INT          NOT NULL,
    date        DATETIME     NOT NULL,
    viewed      BOOLEAN        NOT NULL,

    CONSTRAINT notifications_user_id_fk FOREIGN KEY (user_id) REFERENCES users  (id)
)
    ENGINE = InnoDB;
