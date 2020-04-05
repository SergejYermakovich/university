package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Message;
import com.siarhei.app.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {

    @Query("SELECT m FROM Message m WHERE (m.from.id = ?1 and m.to.id = ?2) or( m.to.id = ?1 and m.from.id = ?2)")
    List<Message> findAllByToAndFrom(Long toId, Long fromId);

    List<Message> findAllByTo(User to);
}
