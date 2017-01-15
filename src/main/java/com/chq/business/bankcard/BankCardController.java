package com.chq.business.bankcard;

import com.chq.business.type.TypeEntity;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
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
@RequestMapping("/bankcard")
public class BankCardController extends BaseController {

    @Autowired
    private IBankCardService bankCardService;


    /**
     * 跳转到数据列表页面
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "business/bankcard/list";
    }


    /**
     * 获取分页列表
     *
     * @param bankCard
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(BankCardEntity bankCard, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        //查询条件
        Map<String, Object> condition = new HashMap<>();

        pageInfo.setCondition(condition);

        bankCardService.selectDataGrid(pageInfo);

        return pageInfo;
    }

    /**
     * 跳转到新建页面
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "business/bankcard/add";
    }

    /**
     * 添加
     *
     * @param bankCard
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(BankCardEntity bankCard) {
        this.bankCardService.insert(bankCard);
        return renderSuccess("添加成功");
    }

    /**
     * 跳转到编辑页面
     *
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Long id, Model model) {
        BankCardEntity bankCard = this.bankCardService.selectById(id);
        model.addAttribute("bankCard", bankCard);
        return "business/bankcard/edit";
    }

    /**
     * 编辑
     *
     * @param bankCard
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(BankCardEntity bankCard) {
        this.bankCardService.updateSelectiveById(bankCard);
        return renderSuccess("添加成功");
    }

    /**
     * 删除分类
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        bankCardService.deleteById(id);
        return renderSuccess("删除成功！");
    }
}
