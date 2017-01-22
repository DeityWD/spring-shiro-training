package com.chq.business.task;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 任务实体类
 */
@TableName("business_task")
public class TaskEntity implements Serializable {

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 任务类型---0：刷单任务，1：收货且评价任务，2：收获任务，3：评价任务
     */
    private String type;
    /**
     * 商品编号
     */
    @TableField(value = "goods_num")
    private String goodsNum;

    /**
     * 下单方式---0：PC，1：APP
     */
    @TableField(value = "farming_type")
    private String farmingType;
    /**
     * 关键词
     */
    private String keyword;
    /**
     * 备注
     */
    private String mark;
    /**
     * 订单编号
     */
    @TableField(value = "order_num")
    private String orderNum;
    /**
     * 评价内容
     */
    @TableField(value = "evaluate_world")
    private String evaluateWorld;
    /**
     * 是否晒图---0：是，1：否
     */
    @TableField(value = "show_picture")
    private String showPicture;
    /**
     * 图片名称
     */
    private String picture;

    /**
     * 任务状态---0：未分配，1：已分配，2：已完成
     */
    private String state;
    /**
     * 完成时间
     */
    @TableField(value = "complete_time")
    private Date completeTime;
    /**
     * 任务接收人ID
     */
    @TableField(value = "owner_id")
    private Long ownerId;
    /**
     * 任务接收人姓名
     */
    @TableField(value = "owner_name")
    private String ownerName;
    /**
     * 店铺名称
     */
    @TableField(value = "shop_name")
    private String shopName;
    /**
     * 分配时间
     */
    @TableField(value = "assign_time")
    private Date assignTime;
    /**
     * 完成IP
     */
    @TableField(value = "complete_ip")
    private String completeIp;
    /**
     * 生成时间
     */
    @TableField(value = "create_time")
    private Date createTime;
    /**
     * 创建人员ＩＤ
     */
    @TableField(value = "create_user_id")
    private Long createUserId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getFarmingType() {
        return farmingType;
    }

    public void setFarmingType(String farmingType) {
        this.farmingType = farmingType == null ? null : farmingType.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark == null ? null : mark.trim();
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum == null ? null : orderNum.trim();
    }

    public String getEvaluateWorld() {
        return evaluateWorld;
    }

    public void setEvaluateWorld(String evaluateWorld) {
        this.evaluateWorld = evaluateWorld == null ? null : evaluateWorld.trim();
    }

    public String getShowPicture() {
        return showPicture;
    }

    public void setShowPicture(String showPicture) {
        this.showPicture = showPicture == null ? null : showPicture.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName == null ? null : ownerName.trim();
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
    }

    public Date getAssignTime() {
        return assignTime;
    }

    public void setAssignTime(Date assignTime) {
        this.assignTime = assignTime;
    }

    public String getCompleteIp() {
        return completeIp;
    }

    public void setCompleteIp(String completeIp) {
        this.completeIp = completeIp == null ? null : completeIp.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }
}