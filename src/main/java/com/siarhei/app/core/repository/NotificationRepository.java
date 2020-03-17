package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationRepository  extends JpaRepository<Notification, Long> {

}
