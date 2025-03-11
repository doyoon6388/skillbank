package com.skillbank.main.service;

import com.skillbank.main.mapper.RequestMapper;
import com.skillbank.main.vo.ProRequestVO;
import com.skillbank.main.vo.ReqeustVO;
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

        if (reqeustVO.getRequest7() == null) reqeustVO.setRequest7("");
        if (reqeustVO.getRequest8() == null) reqeustVO.setRequest8("");
        if (reqeustVO.getRequest9() == null) reqeustVO.setRequest9("");
        if (reqeustVO.getRequest10() == null) reqeustVO.setRequest10("");
        if (reqeustVO.getRequest11() == null) reqeustVO.setRequest11("");
        if (reqeustVO.getRequest12() == null) reqeustVO.setRequest12("");
        if (reqeustVO.getRequest13() == null) reqeustVO.setRequest13("");
        if (reqeustVO.getRequest14() == null) reqeustVO.setRequest14("");

        if (requestMapper.requestReg(reqeustVO) == 1) {
            System.out.println("등록성공");
        }
    }

    public ReqeustVO getDetail(int pk) {
        return requestMapper.getDetail(pk);
    }

    public void requestDelete(int pk) {
        if (requestMapper.requestDelete(pk) == 1) {
            System.out.println("등록성공");
        }
    }

    public List<ProRequestVO> proRequestList() {
        return requestMapper.proRequest();
    }
}
