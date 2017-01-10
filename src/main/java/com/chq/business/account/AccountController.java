package com.chq.business.account;

import com.wangzhixuan.commons.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 账号管理控制类
 * Created by CHQ on 2017/1/10.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {


    /**
     * 跳转到正常账号界面
     * @return
     */
    @GetMapping("/normal")
    public String normal() {
        return "business/account/normal";
    }
}
