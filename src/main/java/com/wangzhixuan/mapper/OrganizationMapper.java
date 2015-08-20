package com.wangzhixuan.mapper;

import java.util.List;

import com.wangzhixuan.model.Organization;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);

    List<Organization> findOrganizationAllByPidNull();

    List<Organization> findOrganizationAllByPid(Long pid);

    List<Organization> findOrganizationAll();
}