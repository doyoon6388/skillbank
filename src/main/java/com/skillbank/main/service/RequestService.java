package com.skillbank.main.service;

import com.skillbank.main.mapper.RequestMapper;
import com.skillbank.main.vo.ProRequestVO;
import com.skillbank.main.vo.ReqeustVO;
import com.skillbank.main.vo.RequestSendVO;
import com.skillbank.main.vo.UserAccountVO;
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


    public ReqeustVO getDetail(int pk) {
        return requestMapper.getDetail(pk);

    }

    public ProRequestVO proRequestDetail(int no) {
        return requestMapper.proRequestDetail(no);
    }
    public void requestDelete(int pk) {
   if(requestMapper.requestDelete(pk) == 1) {
       System.out.println("삭제");
   }
    }

    public List<ProRequestVO> proRequestList() {

        return requestMapper.proRequest();
    }

    public void requestSend(RequestSendVO reqeustVO) {
        if (requestMapper.requestSend(reqeustVO) == 1) {
            System.out.println("등록");
        }
    }
}
