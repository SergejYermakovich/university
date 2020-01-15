package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public  interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByLogin(String login);

    Optional<User> findById(Long id);

    List<User> findAllUsersByRolesRoleName(RoleName role);
}
