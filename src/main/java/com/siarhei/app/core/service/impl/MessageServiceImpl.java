package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Message;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.repository.MessageRepository;
import com.siarhei.app.core.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Override
    public Message save(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public List<Message> findAllByToAndFrom(Long toId, Long fromId) {
        return messageRepository.findAllByToAndFrom(toId, fromId);
    }

    @Override
    public List<Message> findAllByTo(User to) {
        return messageRepository.findAllByTo(to);
    }


}
