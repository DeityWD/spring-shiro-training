package com.chq.business.account;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;

import java.util.List;

/**
 * Created by CHQ on 2017/1/11.
 */
public interface IAccountService extends ISuperService<AccountEntity> {
    void selectDataGrid(PageInfo pageInfo);

    List<AccountEntity> selectByUserName(String userName);
    List<AccountEntity> selectByUserName(AccountEntity account);
}
