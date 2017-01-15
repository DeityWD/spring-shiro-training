package com.chq.business.type;

import com.chq.business.account.AccountEntity;
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
 * Created by CHQ on 2017/1/14.
 */
@Controller
@RequestMapping("/type")
public class TypeController extends BaseController {

    @Autowired
    private ITypeService typeService;

    /**
     * 跳转到数据列表页面
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "business/type/list";
    }

    /**
     * 获取分页列表
     *
     * @param type
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(TypeEntity type, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<>();
        pageInfo.setCondition(condition);
        typeService.selectDataGrid(pageInfo);
        return pageInfo;
    }


    /**
     * 跳转到新建页面
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "business/type/add";
    }

    /**
     * 添加分类
     *
     * @param type
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(TypeEntity type) {
        List<TypeEntity> types = this.typeService.selectByText(type);
        if (!CollectionUtils.isEmpty(types)) {
            return renderError("该分类已存在!");
        }
        this.typeService.insert(type);
        return renderSuccess("添加成功");
    }

    /**
     * 跳转到编辑页面
     *
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Long id, Model model) {
        TypeEntity typeEntity = this.typeService.selectById(id);
        model.addAttribute("type", typeEntity);
        return "business/type/edit";
    }

    /**
     * 编辑分类
     *
     * @param type
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(TypeEntity type) {
        List<TypeEntity> types = this.typeService.selectByText(type);
        if (!CollectionUtils.isEmpty(types)) {
            return renderError("该分类已存在!");
        }
        this.typeService.updateSelectiveById(type);
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
        typeService.deleteById(id);
        return renderSuccess("删除成功！");
    }

}
