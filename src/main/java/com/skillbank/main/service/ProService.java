package com.skillbank.main.service;

import com.skillbank.main.mapper.ProMapper;
import com.skillbank.main.vo.DeductCashVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProService {

    @Autowired
    private ProMapper proMapper;

    public void deductCash(DeductCashVO deductCashVO) {
        proMapper.deductCash(deductCashVO);
    }
}
