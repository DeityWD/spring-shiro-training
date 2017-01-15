package com.chq.business.account;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.User;
import com.wangzhixuan.model.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 账号管理业务逻辑层
 * Created by CHQ on 2017/1/11.
 */
@Service("accountService")
public class AccountServiceImpl extends SuperServiceImpl<AccountMapper, AccountEntity> implements IAccountService {

    @Autowired
    private AccountMapper accountMapper;

    /**
     * 获取数据列表
     *
     * @param pageInfo
     */
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<AccountEntity> page = new Page<AccountEntity>(pageInfo.getNowpage(), pageInfo.getSize());
        List<AccountEntity> list = accountMapper.selectAccountPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    /**
     * 根据账号查询
     *
     * @param userName
     * @return
     */
    @Override
    public List<AccountEntity> selectByUserName(String userName) {

        return this.accountMapper.selectByUserName(userName);
    }

    @Override
    public List<AccountEntity> selectByUserName(AccountEntity account) {
        AccountEntity entity = new AccountEntity();
        entity.setUserName(account.getUserName());
        EntityWrapper<AccountEntity> wrapper = new EntityWrapper<>(entity);
        if (null != account.getId()) {
            wrapper.where("id != {0}", account.getId());
        }
        return this.selectList(wrapper);
    }
}
