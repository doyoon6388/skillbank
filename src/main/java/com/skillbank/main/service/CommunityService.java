package com.skillbank.main.service;

import com.skillbank.main.mapper.CommunityMapper;
import com.skillbank.main.vo.CommunityPostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityService {

    @Autowired
    private CommunityMapper communityMapper;


    public List<CommunityPostVO> getAllTogePost() {
        return communityMapper.getAllTogePost();
    }

    public List<CommunityPostVO> getAllAskproPost() {
        return communityMapper.getAllAskproPost();
    }

    public void createPost(CommunityPostVO communityPostVO) {
        if (communityMapper.createPost(communityPostVO) == 1){
            System.out.println("登録成功！！！！！！！！！！！！！！");
        }
    }
}
