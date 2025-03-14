package com.skillbank.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommunityCommentVO {
    private int comment_id;         // コメントの固有ID（主キー）
    private int comment_post_id;    // 対象投稿のID（community_postのcommu_post_idを参照）
    private int user_id;            // コメント投稿者のユーザーID（user_accountのuser_pkを参照）
    private String comment_content; // コメント内容
    private Date comment_date;      // コメント投稿日時（デフォルトでsysdate）
    private String user_nickname;
}
