package com.chq.business.account;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 账号管理控制类
 * Created by CHQ on 2017/1/10.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {

    @Autowired
    private IAccountService accountService;


    /**
     * 跳转到正常账号界面
     *
     * @return
     */
    @GetMapping("/normal")
    public String normal() {
        return "business/account/normal";
    }
    /**
     * 跳转到异常账号界面
     *
     * @return
     */
    @GetMapping("/abnormal")
    public String abnormal() {
        return "business/account/abnormal";
    }
    /**
     * 跳转到删除账号界面
     *
     * @return
     */
    @GetMapping("/recycle")
    public String recycle() {
        return "business/account/recycle";
    }

    /**
     * 获取正常账号分页列表
     * @param account
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(AccountEntity account, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(account.getUserName())) {
            condition.put("userName", account.getUserName());
        }
        if (StringUtils.isNotBlank(account.getEmail())) {
            condition.put("email", account.getEmail());
        }
        if (StringUtils.isNotBlank(account.getArea())) {
            condition.put("area", account.getArea());
        }
        condition.put("state", '0');

        pageInfo.setCondition(condition);
        accountService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    /**
     * 获取异常账号分页列表
     * @param account
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGridAbnormal")
    @ResponseBody
    public Object dataGridAbnormal(AccountEntity account, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(account.getUserName())) {
            condition.put("userName", account.getUserName());
        }
        if (StringUtils.isNotBlank(account.getEmail())) {
            condition.put("email", account.getEmail());
        }
        if (StringUtils.isNotBlank(account.getArea())) {
            condition.put("area", account.getArea());
        }
        condition.put("state", '1');

        pageInfo.setCondition(condition);
        accountService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    /**
     * 获取删除账号分页列表
     * @param account
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGridRecycle")
    @ResponseBody
    public Object dataGridRecycle(AccountEntity account, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(account.getUserName())) {
            condition.put("userName", account.getUserName());
        }
        if (StringUtils.isNotBlank(account.getEmail())) {
            condition.put("email", account.getEmail());
        }
        if (StringUtils.isNotBlank(account.getArea())) {
            condition.put("area", account.getArea());
        }
        condition.put("state", '2');

        pageInfo.setCondition(condition);
        accountService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加账号
     *
     * @param account
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(AccountEntity account) {
        List<AccountEntity> list = accountService.selectByUserName(account.getUserName());
        if (list != null && !list.isEmpty()) {
            return renderError("账号已存在!");
        }
        account.setState("0");//默认状态0：正常
        account.setCreateDate(new Date());
        accountService.insert(account);
        return renderSuccess("添加成功");
    }

    /**
     * 跳转到新建页面
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "business/account/accountAdd";
    }

    /**
     * 编辑账号
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Long id, Model model) {
        AccountEntity account = accountService.selectById(id);
        model.addAttribute("account", account);
        return "business/account/accountEdit";
    }

    /**
     * 查看账号
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/detailPage")
    public String detailPage(Long id, Model model) {
        AccountEntity account = accountService.selectById(id);
        model.addAttribute("account", account);
        return "business/account/accountDetail";
    }

    @PostMapping("/edit")
    @ResponseBody
    public Object edit(AccountEntity account) {
        List<AccountEntity> list = this.accountService.selectByUserName(account);
        if (list != null && !list.isEmpty()) {
            return renderError("账号已存在!");
        }
        this.accountService.updateSelectiveById(account);
        return renderSuccess("修改成功！");
    }
    /**
     * 标记账号删除页面
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/delPage")
    public String delPage(Long id, Model model) {
        AccountEntity account = accountService.selectById(id);
        model.addAttribute("account", account);
        return "business/account/accountDelete";
    }

    /**
     * 删除账号
     *
     * @param account
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(AccountEntity account) {
        AccountEntity entity = this.accountService.selectById(account.getId());
        entity.setState("2");//删除账号状态2：删除
        entity.setDeleteReason(account.getDeleteReason());
        accountService.updateSelectiveById(entity);
        return renderSuccess("删除成功！");
    }

    /**
     * 标记账号异常页面
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/excepPage")
    public String excepPage(Long id, Model model) {
        AccountEntity account = accountService.selectById(id);
        model.addAttribute("account", account);
        return "business/account/accountExcep";
    }

    /**
     * 标记账号异常
     *
     * @param account
     * @return
     */
    @RequestMapping("/excep")
    @ResponseBody
    public Object excep(AccountEntity account) {
        AccountEntity entity = this.accountService.selectById(account.getId());
        entity.setState("1");//异常账号状态1：异常
        entity.setExceptionReason(account.getExceptionReason());
        accountService.updateSelectiveById(entity);
        return renderSuccess("标记异常成功！");
    }

    /**
     * 恢复账号
     *
     * @param id
     * @return
     */
    @RequestMapping("/recovery")
    @ResponseBody
    public Object recovery(Long id) {
        AccountEntity entity = this.accountService.selectById(id);
        entity.setState("0");//恢复到正常状态0：正常
        accountService.updateSelectiveById(entity);
        return renderSuccess("恢复成功！");
    }
}
