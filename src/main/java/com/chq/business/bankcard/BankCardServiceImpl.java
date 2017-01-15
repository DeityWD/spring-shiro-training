package com.chq.business.bankcard;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by CHQ on 2017/1/15.
 */
@Service("bankCardService")
public class BankCardServiceImpl extends SuperServiceImpl<BankCardMapper, BankCardEntity> implements IBankCardService {

    @Autowired
    private BankCardMapper bankCardMapper;

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<BankCardEntity> page = new Page<>(pageInfo.getNowpage(), pageInfo.getSize());
        List<BankCardEntity> list = bankCardMapper.selectBankCardPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}
