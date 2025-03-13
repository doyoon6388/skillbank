package com.skillbank.main.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface PaymentMapper {

    @Update("UPDATE pro_account SET pro_cash = #{newCash} WHERE pro_pk = #{pk}")
    void updateProCash(int pk, int newCash);
}
