package com.skillbank.main.service;

import com.skillbank.main.mapper.UserMapper;
import com.skillbank.main.vo.UserAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignService {

    @Autowired
    private UserMapper userMapper;

    public boolean registerUser(UserAccountVO user) {
        try {
            // 이메일 중복 체크 (중복 시 회원가입 실패 처리)
            if (userMapper.getUserByEmail(user.getUser_email()) != null) {
                System.out.println("이메일 중복으로 회원가입 실패: " + user.getUser_email());
                return false;
            }

            // 비밀번호 암호화 추가 가능 (추후 구현 고려)
            // user.setUser_pw(passwordEncoder.encode(user.getUser_pw()));

            userMapper.insertUser(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
