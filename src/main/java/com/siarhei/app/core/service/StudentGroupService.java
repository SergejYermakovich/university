package com.siarhei.app.core.service;

import com.siarhei.app.core.model.StudentGroup;

import java.util.List;
import java.util.Optional;

public interface StudentGroupService {

    Optional<StudentGroup> findByName(String name);

    List<StudentGroup> getAll();

}
