package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Notification;
import com.siarhei.app.core.repository.NotificationRepository;
import com.siarhei.app.core.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    @Override
    public Notification save(Notification notification) {
        return notificationRepository.save(notification);
    }
}
