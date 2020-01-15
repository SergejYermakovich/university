package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Role;
import com.siarhei.app.core.model.RoleName;

import java.util.Optional;

public interface RoleService {
    Optional<Role> findRoleByRoleName(RoleName roleName);
}
