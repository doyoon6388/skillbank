package com.skillbank.main.service;

import com.skillbank.main.mapper.UserMapper;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {

    @Autowired
    UserMapper userMapper;

    public UserAccountVO loginValid(UserAccountVO userAccountVO) {
        return userMapper.loginValid(userAccountVO);
    }

    public String loginCheck(HttpSession session) {
        if (session != null && session.getAttribute("user") != null) {
            Object proSession = (Object) session.getAttribute("mode");
            if (proSession != null && proSession.toString().equals("on")) {
                return "login/loginPro.jsp"; // 프로 모드 로그인 페이지
            } else {
                return "login/loginOK.jsp"; // 일반 로그인 페이지
            }
        } else {
            return "login/loginNO.jsp";
        }
    }

    public int proCheck(UserAccountVO userAccountVO) {
        return userMapper.proCheck(userAccountVO);
    }

    public void makeProAccount(ProAccountVO proAccountVO) {
        userMapper.makeProAccount(proAccountVO);
    }

    public void makeHasProOne(ProAccountVO proAccountVO) {
        userMapper.makeHasProOne(proAccountVO);
    }

    public ProAccountVO makeProSession(int pk) {
        return userMapper.makeProSession(pk);
    }
}
