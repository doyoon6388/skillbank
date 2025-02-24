package com.skillbank.main.service;

import com.skillbank.main.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
    @Autowired
    private ChatMapper chatMapper;

}
