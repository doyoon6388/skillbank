package com.skillbank.main.service;

import com.skillbank.main.mapper.UserMapper;
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
            return "login/loginOK.jsp";
        } else {
            return "login/loginNO.jsp";
        }
    }

}
