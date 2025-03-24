package com.skillbank.main.service;

import com.skillbank.main.mapper.CommunityMapper;
import com.skillbank.main.vo.CommunityCommentVO;
import com.skillbank.main.vo.CommunityLikeVO;
import com.skillbank.main.vo.CommunityPostVO;
import com.skillbank.main.vo.FavoriteProVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Service
public class CommunityService {

    @Value("${upload}")
    private String upload;
    //    順番(paging)
    private static final int page_size = 1;

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

    //    本物
    public void createPost(CommunityPostVO communityPostVO, MultipartFile file) {
        // commu_post_categoryがnullの場合エラーハンドリング
        if (communityPostVO.getCommu_post_category() == null || communityPostVO.getCommu_post_category().isEmpty()) {
            throw new IllegalArgumentException("投稿カテゴリが空です。");
        }

        if (!file.getOriginalFilename().isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));

            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String fileName = uuids[0] + fileExtension;

            File saveFile = new File(upload + File.separator + fileName);

            try {
                file.transferTo(saveFile);
                communityPostVO.setCommu_image(fileName);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            communityPostVO.setCommu_image("defaultCommuImg.png");
        }

        if (communityMapper.createPost(communityPostVO) == 1) {
            System.out.println("登録成功！！！！！！！！！！！！！！");
        }
    }

    //順番(paging)
    public int getPostCount(String category) {
        return communityMapper.getPostCount(category);
    }

    public List<CommunityPostVO> getPostsByPage(Model model, String category, int totalCount, int page) {
        int pageSize = 3;
        if (category.equals("askpro")) {
            pageSize = 5;
        }

        int totalPage = (int) Math.ceil((double) totalCount / pageSize);
        if (totalPage < 1) {
            totalPage = 1;
        }
        if (page < 1) {
            page = 1;
        }
        if (page > totalPage) {
            page = totalPage;
        }
        int start = (page - 1) * pageSize + 1;
        int end = start + pageSize - 1;
        System.out.println("start = " + start);
        System.out.println("end = " + end);

        int pageBlockSize = 5;

        // 현재 페이지를 기준으로 보여줄 시작 페이지 번호 계산
        int startPage = ((page - 1) / pageBlockSize) * pageBlockSize + 1;
        // 시작 페이지 번호로부터 pageBlockSize만큼 더해 종료 페이지 번호 계산
        int endPage = startPage + pageBlockSize - 1;
        // totalPages는 전체 페이지 수 (전체 게시글 수 / pageSize)라고 가정
        if (endPage > totalPage) {
            endPage = totalPage;
        }

        // 모델에 추가
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("totalPage", totalPage);
        return communityMapper.getPostsByPage(category, start, end);
    }


    public CommunityPostVO getPostById(int postId) {
        return communityMapper.getPostById(postId);
    }

    public void communityDeletePost(int postId) {
        communityMapper.communityDeletePost(postId);
    }

    public void deletePostWithComments(int postId) {
        communityMapper.deleteCommentsByPostId(postId);
        communityMapper.communityDeletePost(postId);
    }


    public void communityUpdatePost(CommunityPostVO communityPostVO, MultipartFile file) {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String fileName = uuids[0] + fileExtension;
            File saveFile = new File(upload + File.separator + fileName);
            try {
                file.transferTo(saveFile);
                communityPostVO.setCommu_image(fileName);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        communityMapper.communityUpdatePost(communityPostVO);
    }


    public int addComment(CommunityCommentVO comment) {
        int result = communityMapper.insertComment(comment);
        System.out.println("コメント登録結果: " + result);
        System.out.println("登録されたコメント内容: " + comment.getComment_content());
        return result;
    }


    public List<CommunityCommentVO> getCommentsByPost(int postId) {
        return communityMapper.getCommentsByPost(postId);
    }

    public boolean toggleLike(int post_id, int user_id) {
        CommunityLikeVO communityLikeVO = communityMapper.selectLike(user_id, post_id);
        if (communityLikeVO != null) {
            // 찜이 이미 되어 있으면 삭제
            communityMapper.deleteLike(user_id, post_id);
            communityMapper.decrementLike(post_id);
            return false;
        } else {
            // 찜이 되어 있지 않으면 새로 추가
            CommunityLikeVO newLikeVO = new CommunityLikeVO();
            newLikeVO.setUser_id(user_id);
            newLikeVO.setPost_id(post_id);
            communityMapper.insertLike(newLikeVO);
            communityMapper.incrementLike(post_id);
            return true;
        }
    }

    public int getLikeCount(int postId) {
        return communityMapper.countLikes(postId);
    }

    public boolean isFavorited(int user_pk, int pro_pk) {
        CommunityLikeVO communityLikeVO = communityMapper.selectLike(user_pk, pro_pk);
        return communityLikeVO != null;
    }

    public void deleteLikesByPostId(int postId) {
        communityMapper.deleteLikesByPostId(postId);
    }

    //    いいね上位３つ
    public List<CommunityPostVO> getTop3LikedPosts() {
        return communityMapper.getTop3LikedPosts();
    }



}