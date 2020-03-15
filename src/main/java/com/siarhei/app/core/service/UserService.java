package com.siarhei.app.core.service;

import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.model.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    User save(User user);

    Optional<User> findByLogin(String username);

    List<User> findAllByRole(RoleName roleName);

    Optional<User> findById(long id);

    List<User> findAll();

    List<User> findByName(String name);

    List<User> findBySurname(String surname);
}
