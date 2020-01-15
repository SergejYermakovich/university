package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.exceptions.UserAlreadyExistsException;
import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.repository.UserRepository;
import com.siarhei.app.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public User save(User user) {
        boolean isUserNew = user.getId() == null;
        User oldUser = userRepository.findByLogin(user.getLogin()).orElse(null);

        if (oldUser != null && (isUserNew || !oldUser.getId().equals(user.getId()))) {
            throw new UserAlreadyExistsException();
        }
        if (isUserNew) {
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        }
        return userRepository.save(user);
    }

    @Override
    public Optional<User> findByLogin(String username) {
        return userRepository.findByLogin(username);
    }

    @Override
    public List<User> findAllByRole(RoleName roleName) {
        return userRepository.findAllUsersByRolesRoleName(roleName);
    }

    @Override
    public Optional<User> findById(long id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }
}
