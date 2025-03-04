package com.skillbank.main.service;

import com.skillbank.main.mapper.RequestMapper;
import com.skillbank.main.vo.ReqeustVO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RequestService {
    @Autowired
    private RequestMapper requestMapper;

    public void requestReg(ReqeustVO reqeustVO) {
    if(requestMapper.requestReg(reqeustVO) == 1){
        System.out.println("등록성공");
    }
    }

}
