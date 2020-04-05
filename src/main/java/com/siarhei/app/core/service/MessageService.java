package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Message;
import com.siarhei.app.core.model.User;

import java.util.List;

public interface MessageService {

    Message save(Message message);

    List<Message> findAllByToAndFrom(Long toId, Long fromId);

    List<Message> findAllByTo(User to);

}
