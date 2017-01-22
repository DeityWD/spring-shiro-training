package com.chq.business.task;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CHQ on 2017/1/17.
 */
public interface TaskMapper extends AutoMapper<TaskEntity> {

    List<TaskEntity> selectTaskPage(Pagination page, Map<String, Object> params);

    List<TaskEntity> checkIPLimit(HashMap map);
}
