package com.skillbank.main.service;

import com.skillbank.main.mapper.MypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MypageService {

    @Autowired
    private MypageMapper mypageMapper;


    public void updateProfileImg(int userPk, MultipartFile newImg) {

        String oriName = newImg.getOriginalFilename();

        String fileExtension = oriName.substring(oriName.lastIndexOf("."), oriName.length());
        System.out.println(fileExtension);



    }
}
