package com.chq.business.account;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import java.util.List;
import java.util.Map;

/**
 * 账号管理数据库操作层
 * Created by CHQ on 2017/1/11.
 */
public interface AccountMapper extends AutoMapper<AccountEntity> {
    List<AccountEntity> selectAccountPage(Pagination page, Map<String, Object> params);

    List<AccountEntity> selectByUserName(String userName);
}
