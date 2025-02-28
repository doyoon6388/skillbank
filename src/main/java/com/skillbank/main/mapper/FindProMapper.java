package com.skillbank.main.mapper;

import com.skillbank.main.vo.FindProVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FindProMapper {

    @Select("select ssi.*, ssi_img.image from seller_service_info ssi LEFT JOIN seller_service_image ssi_img on ssi.service_no = ssi_img.service_no")

    List<FindProVO> getProServices();

}
