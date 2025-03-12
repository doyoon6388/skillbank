package com.skillbank.main.service;

import com.skillbank.main.mapper.PaymentMapper;
import com.skillbank.main.vo.ProAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;


    public void updateProCash(ProAccountVO proSession) {
        int pk = proSession.getPro_pk();
       int newCash =  proSession.getPro_cash();
        paymentMapper.updateProCash(pk, newCash);


    }
}
