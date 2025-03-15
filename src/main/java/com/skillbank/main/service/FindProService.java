package com.skillbank.main.service;

import com.skillbank.main.mapper.FindProMapper;
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
}
