package com.skillbank.main.service;

import com.skillbank.main.mapper.ReviewMapper;
import com.skillbank.main.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
