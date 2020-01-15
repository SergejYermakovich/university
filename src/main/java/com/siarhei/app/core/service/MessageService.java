package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Message;

import java.util.List;

public interface MessageService {

    Message save(Message message);

    List<Message> findAllByToAndFrom(Long toId, Long fromId);
}
