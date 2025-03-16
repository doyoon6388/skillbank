package com.skillbank.main.service;

import com.skillbank.main.mapper.FindProMapper;
import com.skillbank.main.vo.FavoriteProVO;
import com.skillbank.main.vo.ProAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FindProService {

    @Autowired
    private FindProMapper findProMapper;

    public List<ProAccountVO> getPros(String category, String sort) {
        return findProMapper.selectPros(category, sort);
    }

    public ProAccountVO getDetail(int pro_pk) {
        return findProMapper.getDetail(pro_pk);
    }

    public boolean toggleFavorite(int user_pk, int pro_pk) {
        FavoriteProVO favoriteProVO = findProMapper.selectFavorite(user_pk, pro_pk);
        if (favoriteProVO != null) {
            // 찜이 이미 되어 있으면 삭제
            findProMapper.deleteFavorite(user_pk, pro_pk);
            findProMapper.decrementFavorite(pro_pk);
            return false;
        } else {
            // 찜이 되어 있지 않으면 새로 추가
            FavoriteProVO newFavorite = new FavoriteProVO();
            newFavorite.setUser_pk(user_pk);
            newFavorite.setPro_pk(pro_pk);
            findProMapper.insertFavorite(newFavorite);
            findProMapper.incrementFavorite(pro_pk);
            return true;
        }
    }

    public int getFavoriteCount(int pro_pk) {
        return findProMapper.countFavorites(pro_pk);
    }

    public boolean isFavorited(int user_pk, int pro_pk) {
        FavoriteProVO favorite = findProMapper.selectFavorite(user_pk, pro_pk);
        return favorite != null;
    }
}
