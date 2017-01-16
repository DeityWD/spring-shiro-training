package com.chq.business.shop;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 店铺信息实体类
 */
@TableName("business_shop")
public class ShopEntity implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 店铺名称-----唯一
     */
    @TableField(value = "shop_name")
    private String shopName;
    /**
     * 所欠货款-----下单时增加
     */
    private Float payment = 0f;
    /**
     * 所欠佣金-----完成任务时增加
     */
    private Float commission = 0f;

    /**
     * APP端下单佣金
     */
    @TableField(value = "commission_farming_app")
    private Float commissionFarmingApp = 0f;
    /**
     * PC端下单佣金
     */
    @TableField(value = "commission_farming_pc")
    private Float commissionFarmingPc = 0f;
    /**
     * 收货且评价佣金
     */
    @TableField(value = "commission_receipt_evaluate")
    private Float commissionReceiptEvaluate = 0f;
    /**
     * 收货佣金
     */
    @TableField(value = "commission_receipt")
    private Float commissionReceipt = 0f;
    /**
     * 评价佣金
     */
    @TableField(value = "commission_evaluate")
    private Float commissionEvaluate = 0f;
    /**
     * 合作时间
     */
    @TableField(value = "cooperate_date")
    private Date cooperateDate;
    /**
     * 收货类型
     */
    @TableField(value = "receipt_type")
    private String receiptType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
    }

    public Float getPayment() {
        return payment;
    }

    public void setPayment(Float payment) {
        this.payment = payment;
    }

    public Float getCommission() {
        return commission;
    }

    public void setCommission(Float commission) {
        this.commission = commission;
    }

    public Float getCommissionFarmingApp() {
        return commissionFarmingApp;
    }

    public void setCommissionFarmingApp(Float commissionFarmingApp) {
        this.commissionFarmingApp = commissionFarmingApp;
    }

    public Float getCommissionFarmingPc() {
        return commissionFarmingPc;
    }

    public void setCommissionFarmingPc(Float commissionFarmingPc) {
        this.commissionFarmingPc = commissionFarmingPc;
    }

    public Float getCommissionReceiptEvaluate() {
        return commissionReceiptEvaluate;
    }

    public void setCommissionReceiptEvaluate(Float commissionReceiptEvaluate) {
        this.commissionReceiptEvaluate = commissionReceiptEvaluate;
    }

    public Float getCommissionReceipt() {
        return commissionReceipt;
    }

    public void setCommissionReceipt(Float commissionReceipt) {
        this.commissionReceipt = commissionReceipt;
    }

    public Float getCommissionEvaluate() {
        return commissionEvaluate;
    }

    public void setCommissionEvaluate(Float commissionEvaluate) {
        this.commissionEvaluate = commissionEvaluate;
    }

    public Date getCooperateDate() {
        return cooperateDate;
    }

    public void setCooperateDate(Date cooperateDate) {
        this.cooperateDate = cooperateDate;
    }

    public String getReceiptType() {
        return receiptType;
    }

    public void setReceiptType(String receiptType) {
        this.receiptType = receiptType == null ? null : receiptType.trim();
    }
}