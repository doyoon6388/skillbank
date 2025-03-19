package com.skillbank.main.service;

import com.skillbank.main.mapper.MypageMapper;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MypageService {

    @Value("${upload}")
    private String upload;

    @Autowired
    private MypageMapper mypageMapper;

    public String profileImgUpdate(int user_pk, MultipartFile user_profile_img) {

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



    public String updateProfileImg(int pro_pk, MultipartFile pro_profile_img) {

        String oriName = pro_profile_img.getOriginalFilename();

        String fileExtension = oriName.substring(oriName.lastIndexOf("."), oriName.length());
        System.out.println(fileExtension);


        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
        String[] uuids = uuid.toString().split("-");
        System.out.println(uuids[0]);
        String fileName = uuids[0] + fileExtension;

        File saveFile = new File(upload + "/" + fileName);
        System.out.println(saveFile);
        try {
            pro_profile_img.transferTo(saveFile);
            mypageMapper.updateProProfile(fileName, pro_pk);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;
    }

    // ✅ 회원 정보 수정 기능 추가
    public boolean updateUserInfo(int user_pk, String field, Object value) {
        return mypageMapper.updateUserInfo(user_pk, field, value);
    }

    public List<ProAccountVO> getFavPros(int user_pk) {
        return mypageMapper.selectFavPros(user_pk);
    }
}