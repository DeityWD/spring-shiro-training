package com.chq.business.bankcard;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;

/**
 * Created by CHQ on 2017/1/15.
 */
public interface IBankCardService extends ISuperService<BankCardEntity> {

    void selectDataGrid(PageInfo pageInfo);
}
