package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.model.Teacher;
import com.siarhei.app.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {

    Optional<Teacher> getByUser(User user);

}
