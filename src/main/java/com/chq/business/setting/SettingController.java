package com.chq.business.setting;

import com.wangzhixuan.commons.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by CHQ on 2017/1/14.
 */
@Controller
@RequestMapping("/setting")
public class SettingController extends BaseController {
    @Autowired
    private ISettingService settingService;

    /**
     * 编辑账号
     *
     * @param model
     * @return
     */
    @GetMapping("/setPage")
    public String setPage(Model model) {
        SettingEntity setting = settingService.selectById(1);
        model.addAttribute("setting", setting);
        return "business/setting/setting";
    }

    @PostMapping("/edit")
    @ResponseBody
    public Object edit(SettingEntity setting) {
        this.settingService.updateSelectiveById(setting);
        return renderSuccess("保存成功！");
    }
}
