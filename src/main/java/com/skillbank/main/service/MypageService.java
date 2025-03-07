package com.skillbank.main.service;

import com.skillbank.main.mapper.MypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class MypageService {

    @Autowired
    private MypageMapper mypageMapper;


    public String updateProfileImg(int user_pk, MultipartFile user_profile_img) {

        String oriName = user_profile_img.getOriginalFilename();

        String fileExtension = oriName.substring(oriName.lastIndexOf("."), oriName.length());
        System.out.println(fileExtension);

        String uploadFolder = "C:\\hsw10\\skillbank\\src\\main\\resources\\static\\icons\\profile";

        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
        String[] uuids = uuid.toString().split("-");
        System.out.println(uuids[0]);
        String fileName = uuids[0] + fileExtension;

        File saveFile = new File(uploadFolder + File.separator + fileName);

        try {
            user_profile_img.transferTo(saveFile);

            mypageMapper.updateClientProfile(fileName, user_pk);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return fileName;

    }
}
