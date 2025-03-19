package com.skillbank.main.mapper;

import com.skillbank.main.vo.DeductCashVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ProMapper  {

    @Update("update pro_account set pro_cash = pro_cash - #{deduction} where pro_pk = #{pro_pk}")
    void deductCash(DeductCashVO deductCashVO);
}
