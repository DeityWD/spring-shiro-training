package com.chq.business.type;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.chq.business.account.AccountEntity;
import com.wangzhixuan.commons.utils.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by CHQ on 2017/1/14.
 */
@Service("typeService")
public class TypeServiceImpl extends SuperServiceImpl<TypeMapper, TypeEntity> implements ITypeService {

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<TypeEntity> page = new Page<>(pageInfo.getNowpage(), pageInfo.getSize());
        List<TypeEntity> list = typeMapper.selectTypePage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public List<TypeEntity> selectByText(TypeEntity entity) {
        TypeEntity type = new TypeEntity();
        type.setText(entity.getText());
        EntityWrapper<TypeEntity> wrapper = new EntityWrapper<>(type);
        if (null != entity.getId()) {
            wrapper.where("id != {0}", entity.getId());
        }
        return this.selectList(wrapper);
    }

    @Cacheable(value = "hour", key = "#id")
    @Override
    public TypeEntity getTypeById(Long id) {

        return typeMapper.selectById(id);
    }
}
