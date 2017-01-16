package com.chq.business.goods;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by CHQ on 2017/1/15.
 */
public interface GoodsMapper extends AutoMapper<GoodsEntity> {

    List<GoodsEntity> selectByShopId(Long shopId);


    List<GoodsEntity> selectGoodsPage(Pagination page, Map<String, Object> params);
}
