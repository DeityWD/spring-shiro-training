package com.chq.business.goods;

import com.chq.business.shop.ShopEntity;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CHQ on 2017/1/15.
 */
@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

    @Autowired
    private IGoodsService goodsService;


    /**
     * 跳转到数据列表页面
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "business/goods/list";
    }

    /**
     * 获取分页列表
     *
     * @param goods
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(GoodsEntity goods, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        //查询条件
        Map<String, Object> condition = new HashMap<>();
        if (null != goods.getShopId()) {
            condition.put("shopId", goods.getShopId());
        }
        pageInfo.setCondition(condition);
        goodsService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加
     *
     * @param goods
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(GoodsEntity goods) {
        List<GoodsEntity> shops = this.goodsService.selectByGoodsNum(goods);
        if (!CollectionUtils.isEmpty(shops)) {
            return renderError("该商品已存在！");
        }
        this.goodsService.insert(goods);
        return renderSuccess("添加成功");
    }


    /**
     * 修改
     *
     * @param goods
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(GoodsEntity goods) {
        List<GoodsEntity> shops = this.goodsService.selectByGoodsNum(goods);
        if (!CollectionUtils.isEmpty(shops)) {
            return renderError("该商品已存在！");
        }
        this.goodsService.updateSelectiveById(goods);
        return renderSuccess("修改成功");
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        goodsService.deleteById(id);
        return renderSuccess("删除成功！");
    }
}
