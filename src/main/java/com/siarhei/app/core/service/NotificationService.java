package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Notification;
import com.siarhei.app.core.model.User;

public interface NotificationService {

    Notification save(Notification notification);

    Notification createNotification(
            String message,
            User toWhom
    );

}
