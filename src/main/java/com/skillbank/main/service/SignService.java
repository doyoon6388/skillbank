package com.skillbank.main.service;

import com.skillbank.main.mapper.UserMapper;
import com.skillbank.main.vo.UserAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignService {

    @Autowired
    private UserMapper userMapper;

    /**
     * ✅ 이메일 중복 확인
     */
    public int isEmailAvailable(String email) {
        return userMapper.getUserByEmail(email);
    }

    /**
     * ✅ 닉네임 중복 확인
     */
    public int isNicknameAvailable(String nickname) {
        return userMapper.getUserByNickname(nickname);
    }

    /**
     * ✅ 회원가입 처리
     */
    public boolean registerUser(UserAccountVO user) {
        try {
            // 이메일 중복 체크 (중복 시 회원가입 실패)
            if (isEmailAvailable(user.getUser_email()) == 1) {
                System.out.println("이메일 중복으로 회원가입 실패: " + user.getUser_email());
                return false;
            }

            // 닉네임 중복 체크 (중복 시 회원가입 실패)
            if (isNicknameAvailable(user.getUser_nickname()) == 1) {
                System.out.println("닉네임 중복으로 회원가입 실패: " + user.getUser_nickname());
                return false;
            }

            // TODO: 비밀번호 암호화 추가 가능
            // user.setUser_pw(passwordEncoder.encode(user.getUser_pw()));

            // 회원가입 실행
            userMapper.insertUser(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}