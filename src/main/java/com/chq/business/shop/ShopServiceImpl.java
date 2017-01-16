package com.chq.business.shop;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.chq.business.account.AccountEntity;
import com.wangzhixuan.commons.utils.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Created by CHQ on 2017/1/15.
 */
@Service("shopService")
public class ShopServiceImpl extends SuperServiceImpl<ShopMapper, ShopEntity> implements IShopService {

    @Autowired
    private ShopMapper shopMapper;

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<ShopEntity> page = new Page<>(pageInfo.getNowpage(), pageInfo.getSize());
        List<ShopEntity> list = shopMapper.selectShopPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public List<ShopEntity> selectByShopName(ShopEntity shop) {
        ShopEntity shopEntity = new ShopEntity();
        shopEntity.setShopName(shop.getShopName());
        EntityWrapper<ShopEntity> wrapper = new EntityWrapper<>(shopEntity);
        if (null != shop.getId()) {
            wrapper.where("id != {0}", shop.getId());
        }
        return this.selectList(wrapper);
    }

    @Override
    public List<ShopEntity> selectByShopName(String shopName, Long id) {
        HashMap map = new HashMap();
        map.put("id", id);
        map.put("shopName", shopName);
        return shopMapper.selectByShopName(map);
    }
}
