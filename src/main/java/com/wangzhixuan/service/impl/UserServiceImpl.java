package com.wangzhixuan.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.BeanUtils;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.commons.utils.StringUtils;
import com.wangzhixuan.mapper.UserMapper;
import com.wangzhixuan.mapper.UserRoleMapper;
import com.wangzhixuan.model.User;
import com.wangzhixuan.model.UserRole;
import com.wangzhixuan.model.vo.UserVo;
import com.wangzhixuan.service.IUserService;

/**
 * User 表数据服务层接口实现类
 */
@Service
public class UserServiceImpl extends SuperServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<User> selectByLoginName(UserVo userVo) {
        User user = new User();
        user.setLoginName(userVo.getLoginName());
        EntityWrapper<User> wrapper = new EntityWrapper<User>(user);
        if (null != userVo.getId()) {
            wrapper.where("id != {0}", userVo.getId());
        }
        return this.selectList(wrapper);
    }

    @Override
    public void insertByVo(UserVo userVo) {
        User user = BeanUtils.copy(userVo, User.class);
        user.setCreateTime(new Date());
        this.insert(user);

        Long id = user.getId();
        String[] roles = userVo.getRoleIds().split(",");
        UserRole userRole = new UserRole();

        for (String string : roles) {
            userRole.setUserId(id);
            userRole.setRoleId(Long.valueOf(string));
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public UserVo selectVoById(Long id) {
        return userMapper.selectUserVoById(id);
    }

    @Override
    public void updateByVo(UserVo userVo) {
        User user = BeanUtils.copy(userVo, User.class);
        if (StringUtils.isBlank(user.getPassword())) {
            user.setPassword(null);
        }
        this.updateSelectiveById(user);

        Long id = userVo.getId();
        List<UserRole> userRoles = userRoleMapper.selectByUserId(id);
        if (userRoles != null && !userRoles.isEmpty()) {
            for (UserRole userRole : userRoles) {
                userRoleMapper.deleteById(userRole.getId());
            }
        }

        String[] roles = userVo.getRoleIds().split(",");
        UserRole userRole = new UserRole();
        for (String string : roles) {
            userRole.setUserId(id);
            userRole.setRoleId(Long.valueOf(string));
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public void updatePwdByUserId(Long userId, String md5Hex) {
        User user = new User();
        user.setId(userId);
        user.setPassword(md5Hex);
        this.updateSelectiveById(user);
    }

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<UserVo> page = new Page<UserVo>(pageInfo.getNowpage(), pageInfo.getSize());
        List<UserVo> list = userMapper.selectUserVoPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public void deleteUserById(Long id) {
        this.deleteById(id);
        List<UserRole> userRoles = userRoleMapper.selectByUserId(id);
        if (userRoles != null && !userRoles.isEmpty()) {
            for (UserRole userRole : userRoles) {
                userRoleMapper.deleteById(userRole.getId());
            }
        }
    }

    /**
     * 根据用户类型查询用户信息
     * @param type
     * @return
     */
    @Override
    public List<User> getUsersByType(Integer type) {
        User user = new User();
        user.setUserType(type);
        EntityWrapper<User> wrapper = new EntityWrapper<>(user);
        return selectList(wrapper);
    }
}