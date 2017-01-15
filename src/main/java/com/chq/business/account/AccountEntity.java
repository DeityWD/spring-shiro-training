package com.chq.business.account;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 账号信息
 */
@TableName("business_account")
public class AccountEntity implements Serializable {

    /** 主键id */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**账号用户名 */
    @TableField(value = "user_name")
    private String userName;
    /**登陆密码 */
    @TableField(value = "password_login")
    private String passwordLogin;
    /** 支付密码*/
    @TableField(value = "password_pay")
    private String passwordPay;
    /** 绑定邮箱*/
    private String email;
    /** 邮箱密码*/
    @TableField(value = "password_email")
    private String passwordEmail;
    /** 账号所属地区*/
    private String area;
    /**运营商 */
    private String operator;
    /**账号等级 */
    private String level;
    /** 数据状态*/
    private String state;
    /**注册日期 */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "register_date")
    private Date registerDate;
    /**绑定手机号 */
    private String phone;
    /**收获地址 */
    private String address;
    /**绑定身份证号 */
    @TableField(value = "person_id")
    private String personId;
    /**绑定人员姓名 */
    @TableField(value = "person_name")
    private String personName;
    /**删除原因 */
    @TableField(value = "delete_reason")
    private String deleteReason;
    /**异常原因 */
    @TableField(value = "exception_reason")
    private String exceptionReason;
    /** 创建时间*/
    @TableField(value = "create_Date")
    private Date createDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPasswordLogin() {
        return passwordLogin;
    }

    public void setPasswordLogin(String passwordLogin) {
        this.passwordLogin = passwordLogin == null ? null : passwordLogin.trim();
    }

    public String getPasswordPay() {
        return passwordPay;
    }

    public void setPasswordPay(String passwordPay) {
        this.passwordPay = passwordPay == null ? null : passwordPay.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPasswordEmail() {
        return passwordEmail;
    }

    public void setPasswordEmail(String passwordEmail) {
        this.passwordEmail = passwordEmail == null ? null : passwordEmail.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId == null ? null : personId.trim();
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName == null ? null : personName.trim();
    }

    public String getDeleteReason() {
        return deleteReason;
    }

    public void setDeleteReason(String deleteReason) {
        this.deleteReason = deleteReason == null ? null : deleteReason.trim();
    }

    public String getExceptionReason() {
        return exceptionReason;
    }

    public void setExceptionReason(String exceptionReason) {
        this.exceptionReason = exceptionReason == null ? null : exceptionReason.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}