package com.chq.business.shop;

import com.chq.business.goods.IGoodsService;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/shop")
public class ShopController extends BaseController {

    @Autowired
    private IShopService shopService;
    @Autowired
    private IGoodsService goodsService;

    /**
     * 跳转到数据列表页面
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "business/shop/list";
    }


    /**
     * 获取分页列表
     *
     * @param shop
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(ShopEntity shop, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        //查询条件
        Map<String, Object> condition = new HashMap<>();
        if (StringUtils.isNotBlank(shop.getShopName())) {
            condition.put("shopName", shop.getShopName());
        }
        if (StringUtils.isNotBlank(shop.getReceiptType())) {
            condition.put("receiptType", shop.getReceiptType());
        }
        pageInfo.setCondition(condition);
        shopService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 跳转到新建页面
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "business/shop/add";
    }

    /**
     * 添加
     *
     * @param shop
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(ShopEntity shop) {
        List<ShopEntity> shops = this.shopService.selectByShopName(shop.getShopName(), null);
        if (!CollectionUtils.isEmpty(shops)) {
            return renderError("该店铺已存在！");
        }
        this.shopService.insert(shop);
        return renderSuccess("添加成功");
    }

    /**
     * 跳转到编辑页面
     *
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Long id, Model model) {
        ShopEntity shop = this.shopService.selectById(id);
        model.addAttribute("shop", shop);
        return "business/shop/edit";
    }

    /**
     * 编辑
     *
     * @param shop
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(ShopEntity shop) {
        List<ShopEntity> shops = this.shopService.selectByShopName(shop.getShopName(), shop.getId());
        if (!CollectionUtils.isEmpty(shops)) {
            return renderError("该店铺已存在！");
        }
        this.shopService.updateSelectiveById(shop);
        return renderSuccess("添加成功");
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
        shopService.deleteById(id);
        return renderSuccess("删除成功！");
    }

    /**
     * 跳转到商品展示页面
     *
     * @return
     */
    @GetMapping("/goodsPage")
    public String goodsPage(Long id, Model model) {
        model.addAttribute("shopId", id);
        return "business/goods/list";
    }
}
