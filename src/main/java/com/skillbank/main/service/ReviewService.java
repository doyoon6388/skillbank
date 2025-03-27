package com.skillbank.main.service;

import com.skillbank.main.mapper.ReviewMapper;
import com.skillbank.main.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;


    public int createReview(ReviewVO reviewVO) {
        return reviewMapper.createReview(reviewVO);
    }

    public ReviewVO getReview(ReviewVO reviewVO) {
        return reviewMapper.getReview(reviewVO);
    }

    public void completeRequest(int chatReqNo) {
        reviewMapper.completeRequest(chatReqNo);
    }

    public void completeChat(int chatReqNo) {
        reviewMapper.completeChat(chatReqNo);
    }

    public List<ReviewVO> incompleteReviewList(int user_pk) {
       return reviewMapper.incompleteReviewList(user_pk);
    }
    public List<ReviewVO> completeReviewList(int user_pk) {
       return reviewMapper.completeReviewList(user_pk);
    }

    public ReviewVO getReviewByPk(int reviewPk) {
        return reviewMapper.getReviewByPk(reviewPk);
    }

    public int updateReview(ReviewVO reviewVO) {
        return reviewMapper.updateReview(reviewVO);
    }

    public void updateProReview(ReviewVO reviewVO) {
        reviewMapper.updateProReview(reviewVO);
    }
}
