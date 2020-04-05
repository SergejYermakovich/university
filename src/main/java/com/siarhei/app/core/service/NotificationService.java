package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Notification;
import com.siarhei.app.core.model.User;

import java.util.List;

public interface NotificationService {

    Notification save(Notification notification);

    Notification createNotification(
            String message,
            User toWhom
    );

    List<Notification> findAllByUser(User user);
}
