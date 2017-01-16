package com.chq.business.goods;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;

import java.util.List;

/**
 * Created by CHQ on 2017/1/15.
 */
public interface IGoodsService extends ISuperService<GoodsEntity> {
    void selectDataGrid(PageInfo pageInfo);

    List<GoodsEntity> selectByShopId(Long shopId);

    List<GoodsEntity> selectByGoodsNum(GoodsEntity goods);
}
