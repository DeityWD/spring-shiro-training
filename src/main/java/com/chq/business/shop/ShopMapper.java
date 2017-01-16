package com.chq.business.shop;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CHQ on 2017/1/15.
 */
public interface ShopMapper extends AutoMapper<ShopEntity> {

    List<ShopEntity> selectShopPage(Pagination page, Map<String, Object> params);

    List<ShopEntity> selectByShopName(HashMap map);
}
