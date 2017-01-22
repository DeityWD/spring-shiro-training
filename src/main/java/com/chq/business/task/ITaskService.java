package com.chq.business.task;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;

import java.util.Date;
import java.util.List;

/**
 * Created by CHQ on 2017/1/17.
 */
public interface ITaskService extends ISuperService<TaskEntity> {
    void selectDataGrid(PageInfo pageInfo);

    void distributionTask(Long[] ids, Long userId, String name);

    List<TaskEntity> checkIPLimit(String ip, Date date);
}
