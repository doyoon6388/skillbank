package com.skillbank.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityPostVO {
    private int commu_post_id;       // 게시글 고유번호 (PK)
    private String commu_post_category;
    private int commu_user_id;       // 작성자 (user_account 테이블의 user_id 참조)
    private String commu_title;     // 게시글 제목
    private Date commu_date; // 작성일자 (sysdate)
    private String commu_content;   // 게시글 내용
    private String commu_image;

    private int commu_writer; // clientなら1、proなら0
    private int commu_like;

    private String commu_tags;
}
