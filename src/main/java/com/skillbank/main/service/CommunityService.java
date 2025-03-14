package com.skillbank.main.service;

import com.skillbank.main.mapper.CommunityMapper;
import com.skillbank.main.vo.CommunityCommentVO;
import com.skillbank.main.vo.CommunityPostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class CommunityService {

    @Value("${upload}")
    private String upload;
    //    順番(paging)
    private static final int page_size = 2;

    @Autowired
    private CommunityMapper communityMapper;

    public String getUploadPath() {
        return upload;
    }


    public List<CommunityPostVO> getAllTogePost() {
        return communityMapper.getAllTogePost();
    }

    public List<CommunityPostVO> getAllAskproPost() {
        return communityMapper.getAllAskproPost();
    }

    public void createPost(CommunityPostVO communityPostVO, MultipartFile file) {
        if (!file.getOriginalFilename().isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));

            UUID uuid = UUID.randomUUID();
            System.out.println(uuid);
            String[] uuids = uuid.toString().split("-");
            System.out.println(uuids[0]);
            String fileName = uuids[0] + fileExtension;

            File saveFile = new File(upload + File.separator + fileName);

            try {
                file.transferTo(saveFile); // 실제 파일 저장 기능

                communityPostVO.setCommu_image(fileName);


            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            communityPostVO.setCommu_image("defaultCommuImg.png");
        }

        if (communityMapper.createPost(communityPostVO) == 1){
            System.out.println("登録成功！！！！！！！！！！！！！！");
        }
    }

    //順番(paging)
    public int getPostCount(String category) {
        return communityMapper.getPostCount(category);
    }

    public  List<CommunityPostVO> getPostsByPage(String category, int page) {
        int start = (page - 1) * page_size + 1;
        int end = start + page_size;
        return communityMapper.getPostsByPage(category, start, end);
    }


    public CommunityPostVO getPostById(int postId) {
        return communityMapper.getPostById(postId);
    }

    public void communityDeletePost(int postId) {
        communityMapper.communityDeletePost(postId);
    }

//    public int addComment(CommunityCommentVO comment) {
//        return communityMapper.insertComment(comment);
//    }

    public int addComment(CommunityCommentVO comment) {
        int result = communityMapper.insertComment(comment);
        System.out.println("コメント登録結果: " + result);
        System.out.println("登録されたコメント内容: " + comment.getComment_content());
        return result;
    }


    public List<CommunityCommentVO> getCommentsByPost(int postId) {
        return communityMapper.getCommentsByPost(postId);
    }


//    public void updatePost(CommunityPostVO communityPostVO) {
//    }

}
