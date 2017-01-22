package com.chq.business.task;

import com.chq.business.goods.IGoodsService;
import com.chq.business.setting.ISettingService;
import com.chq.business.setting.SettingEntity;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.shiro.ShiroUser;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.commons.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by CHQ on 2017/1/16.
 */
@Controller
@RequestMapping("/task")
public class TaskController extends BaseController {

    @Autowired
    private ITaskService taskService;

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private ISettingService settingService;


    /**
     * 跳转到数据列表页面
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "business/task/list";
    }


    /**
     * 获取分页列表
     *
     * @param task
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(TaskEntity task, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        //查询条件
        Map<String, Object> condition = new HashMap<>();
        if (null != task.getGoodsNum()) {
            condition.put("goodsNum", task.getGoodsNum());
        }
        if (StringUtils.isNotBlank(task.getType())) {
            condition.put("type", task.getType());
        }
        pageInfo.setCondition(condition);
        taskService.selectDataGrid(pageInfo);
        return pageInfo;
    }


    /**
     * 跳转到新建页面
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage(String type) {
        return "business/task/add" + type;
    }

    /**
     * 添加
     *
     * @param task
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(TaskEntity task) {
        if ("0".equals(task.getType()) && !goodsService.checkGoodsByGoodsNum(task.getGoodsNum())) {
            return renderError("该商品编号不存在");
        }
        ShiroUser shiroUser = getShiroUser();
        task.setCreateUserId(shiroUser.getId());
        task.setCreateTime(new Date());
        task.setState("0");
        this.taskService.insert(task);
        return renderSuccess("添加成功");
    }

    /**
     * 跳转到编辑页面
     *
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Long id, Model model) {
        TaskEntity task = this.taskService.selectById(id);
        model.addAttribute("task", task);
        if ("0".equals(task.getType())) {
            return "business/task/edit1";
        } else if ("1".equals(task.getType())) {
            return "business/task/edit2";
        } else if ("2".equals(task.getType())) {
            return "business/task/edit3";
        } else {
            return "business/task/edit4";
        }
    }

    /**
     * 编辑
     *
     * @param task
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(TaskEntity task) {
        if ("0".equals(task.getType()) && !goodsService.checkGoodsByGoodsNum(task.getGoodsNum())) {
            return renderError("该商品编号不存在");
        }
        this.taskService.updateSelectiveById(task);
        return renderSuccess("更新成功");
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
        taskService.deleteById(id);
        return renderSuccess("删除成功！");
    }

    /**
     * 跳转到编辑页面
     *
     * @return
     */
    @GetMapping("/detailPage")
    public String detailPage(Long id, Model model) {
        TaskEntity task = this.taskService.selectById(id);
        model.addAttribute("task", task);
        if ("0".equals(task.getType())) {
            return "business/task/detail1";
        } else if ("1".equals(task.getType())) {
            return "business/task/detail2";
        } else if ("2".equals(task.getType())) {
            return "business/task/detail3";
        } else {
            return "business/task/detail4";
        }
    }


    /**
     * 跳转到分配任务页面
     *
     * @return
     */
    @GetMapping("/distributionPage")
    public String distributionPage() {
        return "business/task/distribution";
    }

    /**
     * 分配任务
     *
     * @param ids
     * @return
     */
    @RequestMapping("/distribution")
    @ResponseBody
    public Object distribution(Long[] ids, Long userId, String name) {
        this.taskService.distributionTask(ids, userId, name);
        return renderSuccess("分配成功");
    }


    /**
     * 跳转到我的任务数据列表页面
     *
     * @return
     */
    @GetMapping(value = "/myTask")
    public String myTask() {
        return "business/task/myTask";
    }

    /**
     * 获取我的任务分页列表
     *
     * @param task
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/myDataGrid")
    @ResponseBody
    public Object myDataGrid(TaskEntity task, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows);
        //查询条件
        Map<String, Object> condition = new HashMap<>();
        if (null != task.getGoodsNum()) {
            condition.put("goodsNum", task.getGoodsNum());
        }
        if (StringUtils.isNotBlank(task.getType())) {
            condition.put("type", task.getType());
        }
        ShiroUser user = getShiroUser();
        condition.put("ownerId", user.getId());
        pageInfo.setCondition(condition);
        taskService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 跳转到检查IP页面
     *
     * @return
     */
    @GetMapping("/checkPage")
    public String checkPage() {
        return "business/task/checkIP";
    }

    /**
     * 检查IP是否可用
     *
     * @param ip
     * @return
     */
    @PostMapping("/checkIP")
    @ResponseBody
    public Object checkIP(String ip) {
        SettingEntity setting = settingService.selectById(1);
        if (null != setting) {
            int limitIp = setting.getLimitIp();
            Date now = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.HOUR_OF_DAY, -limitIp);  //IP限定的时间
            Date date = calendar.getTime();
            List<TaskEntity> tasks = taskService.checkIPLimit(ip, date);
            if (tasks.size() > 0) {
                return renderSuccess("该IP尚在疲劳期，不可用！");
            } else {
                return renderSuccess("该IP可用！");
            }
        }
        return renderSuccess("请设置疲劳度信息");
    }
}
