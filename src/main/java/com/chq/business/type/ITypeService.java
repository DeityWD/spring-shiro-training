package com.chq.business.type;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;

import java.util.List;

/**
 * Created by CHQ on 2017/1/14.
 */
public interface ITypeService extends ISuperService<TypeEntity> {

    void selectDataGrid(PageInfo pageInfo);

    List<TypeEntity> selectByText(TypeEntity entity);
}
