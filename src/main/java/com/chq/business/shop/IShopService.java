package com.chq.business.shop;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;

import java.util.List;

/**
 * Created by CHQ on 2017/1/15.
 */
public interface IShopService extends ISuperService<ShopEntity> {

    void selectDataGrid(PageInfo pageInfo);

    List<ShopEntity> selectByShopName(ShopEntity shop);

    List<ShopEntity> selectByShopName(String shopName, Long id);
}
