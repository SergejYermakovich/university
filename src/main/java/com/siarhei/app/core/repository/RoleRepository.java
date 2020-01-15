package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Role;
import com.siarhei.app.core.model.RoleName;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findRoleByRoleName(RoleName roleName);
}