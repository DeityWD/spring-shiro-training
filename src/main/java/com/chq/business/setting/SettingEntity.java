package com.chq.business.setting;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * 业务设置信息
 */
@TableName("business_setting")
public class SettingEntity implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 同店疲劳度：同一个账号在一个店铺中购买东西的时间间隔天数
     */
    @TableField(value = "limit_shop")
    private Integer limitShop;
    /**
     * 同商品疲劳度：同一个账号购买同一个商品的时间间隔天数
     */
    @TableField(value = "limit_good")
    private Integer limitGood;
    /**
     * 月购买数量疲劳度：同一个账号每个月购买商品数量
     */
    @TableField(value = "limit_number")
    private Integer limitNumber;
    /**
     * 月最大购买金额疲劳度：同一个账号每个月购买金额最大数
     */
    @TableField(value = "limit_money")
    private Float limitMoney;
    /**
     * 收货天数限制：订单收货间隔天数
     */
    @TableField(value = "limit_receipt_day")
    private Integer limitReceiptDay;
    /**
     * 注册日期限制：账号注册后多长时间可以使用
     */
    @TableField(value = "limit_register_day")
    private Integer limitRegisterDay;
    /**
     * 同IP使用时间间隔限制
     */
    @TableField(value = "limit_ip")
    private Integer limitIp;
    /**
     * 同一个商品分类购买时间间隔限制天数
     */
    @TableField(value = "limit_type")
    private Integer limitType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getLimitShop() {
        return limitShop;
    }

    public void setLimitShop(Integer limitShop) {
        this.limitShop = limitShop;
    }

    public Integer getLimitGood() {
        return limitGood;
    }

    public void setLimitGood(Integer limitGood) {
        this.limitGood = limitGood;
    }

    public Integer getLimitNumber() {
        return limitNumber;
    }

    public void setLimitNumber(Integer limitNumber) {
        this.limitNumber = limitNumber;
    }

    public Float getLimitMoney() {
        return limitMoney;
    }

    public void setLimitMoney(Float limitMoney) {
        this.limitMoney = limitMoney;
    }

    public Integer getLimitReceiptDay() {
        return limitReceiptDay;
    }

    public void setLimitReceiptDay(Integer limitReceiptDay) {
        this.limitReceiptDay = limitReceiptDay;
    }

    public Integer getLimitRegisterDay() {
        return limitRegisterDay;
    }

    public void setLimitRegisterDay(Integer limitRegisterDay) {
        this.limitRegisterDay = limitRegisterDay;
    }

    public Integer getLimitIp() {
        return limitIp;
    }

    public void setLimitIp(Integer limitIp) {
        this.limitIp = limitIp;
    }

    public Integer getLimitType() {
        return limitType;
    }

    public void setLimitType(Integer limitType) {
        this.limitType = limitType;
    }
}