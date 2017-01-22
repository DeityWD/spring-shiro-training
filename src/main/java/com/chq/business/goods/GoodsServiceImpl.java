package com.chq.business.goods;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by CHQ on 2017/1/15.
 */
@Service("goodsService")
public class GoodsServiceImpl extends SuperServiceImpl<GoodsMapper, GoodsEntity> implements IGoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public List<GoodsEntity> selectByShopId(Long shopId) {

        return goodsMapper.selectByShopId(shopId);
    }

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<GoodsEntity> page = new Page<>(pageInfo.getNowpage(), pageInfo.getSize());
        List<GoodsEntity> list = goodsMapper.selectGoodsPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }


    @Override
    public List<GoodsEntity> selectByGoodsNum(GoodsEntity goods) {
        GoodsEntity entity = new GoodsEntity();
        entity.setGoodsNum(goods.getGoodsNum());
        EntityWrapper<GoodsEntity> wrapper = new EntityWrapper<>(entity);
        if (null != goods.getId()) {
            wrapper.where("id != {0}", goods.getId());
        }
        return this.selectList(wrapper);
    }
    /**
     * 检查商品是否存在
     * @param goodsNum
     * @return
     */
    @Override
    public boolean checkGoodsByGoodsNum(String goodsNum) {
        GoodsEntity goods = new GoodsEntity();
        goods.setGoodsNum(goodsNum);
        List<GoodsEntity> goodsList = selectByGoodsNum(goods);
        if (CollectionUtils.isEmpty(goodsList)) {
            return false;
        }
        return true;
    }
}
