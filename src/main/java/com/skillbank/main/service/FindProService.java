package com.skillbank.main.service;

import com.skillbank.main.mapper.FindProMapper;
import com.skillbank.main.vo.FindProVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FindProService {

    @Autowired
    FindProMapper findProMapper;

    public List<FindProVO> getProServices() {

        return findProMapper.getProServices();

    }

}
