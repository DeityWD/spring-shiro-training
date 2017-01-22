package com.chq.business.task;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by CHQ on 2017/1/17.
 */
@Service("taskService")
public class TaskServiceImpl extends SuperServiceImpl<TaskMapper, TaskEntity> implements ITaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<TaskEntity> page = new Page<>(pageInfo.getNowpage(), pageInfo.getSize());
        List<TaskEntity> list = taskMapper.selectTaskPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    /**
     * 分配任务
     *
     * @param ids
     * @param userId
     * @return
     */
    @Override
    public void distributionTask(Long[] ids, Long userId, String name) {
        for (int i = 0; i < ids.length; i++) {
            TaskEntity task = new TaskEntity();
            task.setId(ids[i]);
            task.setOwnerId(userId);
            task.setAssignTime(new Date());
            task.setOwnerName(name);
            task.setState("1");
            this.updateSelectiveById(task);
        }
    }

    /**
     * 检查疲劳期内的任务数
     * @param ip
     * @param date
     * @return
     */
    @Override
    public List<TaskEntity> checkIPLimit(String ip, Date date) {
        HashMap map = new HashMap();
        map.put("ip", ip);
        map.put("data", date);

        return taskMapper.checkIPLimit(map);
    }
}
