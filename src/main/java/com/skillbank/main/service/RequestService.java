package com.skillbank.main.service;

import com.skillbank.main.mapper.RequestMapper;
import com.skillbank.main.vo.ReqeustVO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RequestService {
    @Autowired
    private RequestMapper requestMapper;

    public List<ReqeustVO> requestList(int id) {
        return requestMapper.requestList(id);
    }
    public void requestReg(ReqeustVO reqeustVO) {
    if(requestMapper.requestReg(reqeustVO) == 1){
        System.out.println("등록성공");
    }
    }


}
