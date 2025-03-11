package com.skillbank.main.service;

import com.skillbank.main.mapper.MypageMapper;
import com.skillbank.main.vo.UserAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class MypageService {

    @Value("${upload}")
    private String upload;

    @Autowired
    private MypageMapper mypageMapper;

    // ✅ 프로필 이미지 변경
    public String updateProfileImg(int user_pk, MultipartFile user_profile_img) {
        String oriName = user_profile_img.getOriginalFilename();
        String fileExtension = oriName.substring(oriName.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString().split("-")[0] + fileExtension;

        File saveFile = new File(upload + "/" + fileName);
        try {
            user_profile_img.transferTo(saveFile);
            mypageMapper.updateClientProfile(fileName, user_pk);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;
    }

    // ✅ 회원 정보 수정 기능 추가
    public boolean updateUserInfo(int user_pk, String field, Object value) {
        return mypageMapper.updateUserInfo(user_pk, field, value);
    }
}