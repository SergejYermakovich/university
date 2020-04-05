package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Notification;
import com.siarhei.app.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NotificationRepository  extends JpaRepository<Notification, Long> {

    List<Notification> findAllByUser(User user);
}
