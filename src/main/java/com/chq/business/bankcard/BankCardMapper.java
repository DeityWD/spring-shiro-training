package com.chq.business.bankcard;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import java.util.List;
import java.util.Map;

/**
 * Created by CHQ on 2017/1/15.
 */
public interface BankCardMapper extends AutoMapper<BankCardEntity> {

    List<BankCardEntity> selectBankCardPage(Pagination page, Map<String, Object> params);
}
