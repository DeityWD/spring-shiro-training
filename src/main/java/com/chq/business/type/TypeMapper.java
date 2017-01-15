package com.chq.business.type;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by CHQ on 2017/1/14.
 */
public interface TypeMapper extends AutoMapper<TypeEntity> {

    List<TypeEntity> selectTypePage(Pagination page, Map<String, Object> params);
}
