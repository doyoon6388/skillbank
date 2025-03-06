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
            System.out.println("회원가입 요청: " + user);

            // 필수 입력값 검증
            if (user.getUser_email() == null || user.getUser_email().isEmpty() ||
                    user.getUser_pw() == null || user.getUser_pw().isEmpty() ||
                    user.getUser_name() == null || user.getUser_name().isEmpty() ||
                    user.getUser_gender() == null || user.getUser_gender().isEmpty() ||
                    user.getUser_address() == null || user.getUser_address().isEmpty() ||
                    user.getUser_birth() == null ||
                    user.getUser_phone() == null || user.getUser_phone().isEmpty() ||
                    user.getUser_profile_img() == null || user.getUser_profile_img().isEmpty() ||
                    user.getUser_nickname() == null || user.getUser_nickname().isEmpty()) {

                System.out.println("회원가입 실패: 필수 입력값 누락됨");
                return false;
            }

            // 이메일 중복 체크
            if (userMapper.getUserByEmail(user.getUser_email()) != null) {
                System.out.println("회원가입 실패: 이메일 중복 - " + user.getUser_email());
                return false;
            }

            // user_hasPro 기본값 설정
            user.setUser_hasPro(0);

            // DB에 회원 정보 삽입
            int result = userMapper.insertUser(user);
            System.out.println("회원가입 DB 처리 결과: " + result);

            return result > 0;
        } catch (Exception e) {
            System.out.println("회원가입 중 예외 발생!");
            e.printStackTrace();
            return false;
        }
    }
}