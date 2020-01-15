package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Role;
import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.repository.RoleRepository;
import com.siarhei.app.core.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepository roleRepository;

    @Override
    public Optional<Role> findRoleByRoleName(RoleName roleName) {
        return roleRepository.findRoleByRoleName(roleName);
    }
}
