<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#executeTaskForm').form({
            url: '${path }/task/executeTask',
            onSubmit: function () {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if (!check()) {
                    progressClose();
                    return false;
                }
                return isValid;
            },
            success: function (result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
        if ('${task.farmingType}' == '0') {
            $("#farmingType").append("开启")
        } else {
            $("#farmingType").append("关闭")
        }
    });

    function check() {
        var unCheckedBoxs = $("input[name='myCheckbox']").not("input:checked");
        if (unCheckedBoxs.length > 0) {
            parent.$.messager.alert('提示', "任务要求未完成！", 'warning');
            return false;
        }
        return true;
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: auto;padding: 3px;">
        <form id="executeTaskForm" method="post">
            <table class="grid">
                <tr>
                    <td colspan="4" style="text-align: center"><b>任务信息</b></td>
                </tr>
                <tr>
                    <td width="20%">商品编号</td>
                    <td width="30%">${task.goodsNum}</td>
                    <td width="20%">下单方式</td>
                    <td>
                        <span id="farmingType"></span>
                    </td>
                </tr>
                <tr>
                    <td>关键词</td>
                    <td>${task.keyword}</td>
                    <td>备注</td>
                    <td>${task.mark}</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><b>账号信息</b></td>
                </tr>
                <tr>
                    <td>账号</td>
                    <td>${account.userName}</td>
                    <td>登陆密码</td>
                    <td>${account.passwordLogin}</td>
                </tr>
                <tr>
                    <td>支付密码</td>
                    <td>${account.passwordPay}</td>
                    <td>所属地区</td>
                    <td>${account.area}</td>
                </tr>
                <tr>
                    <td>绑定邮箱</td>
                    <td>${account.email}</td>
                    <td>邮箱密码</td>
                    <td>${account.passwordEmail}</td>
                </tr>
                <tr>
                    <td>运营商</td>
                    <td>
                        ${account.operator}
                    </td>
                    <td>账号等级</td>
                    <td>
                        <select id="level" name="level" class="easyui-combobox" value="${account.level}"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="注册会员">注册会员</option>
                            <option value="铜牌会员">铜牌会员</option>
                            <option value="银牌会员">银牌会员</option>
                            <option value="金牌会员">金牌会员</option>
                            <option value="钻石会员">钻石会员</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td><input id="personId" name="personId" type="text" class="easyui-validatebox"
                               value="${account.personId}"></td>
                    <td>人员姓名</td>
                    <td><input id="personName" name="personName" type="text" class="easyui-validatebox"
                               value="${account.personName}"></td>
                </tr>
                <tr>
                    <td>绑定手机号</td>
                    <td><input id="phone" name="phone" type="text" class="easyui-validatebox" value="${account.phone}">
                    </td>
                    <td>收货地址</td>
                    <td><input id="address" name="address" type="text" class="easyui-validatebox"
                               value="${account.address}"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><b>任务要求</b>(必须执行)</td>
                </tr>
                <tr>
                    <td><label><input name="myCheckbox" type="checkbox" value=""/>外比</label></td>
                    <td><label><input name="myCheckbox" type="checkbox" value=""/>内比</label></td>
                    <td><label><input name="myCheckbox" type="checkbox" value=""/>收藏主款</label></td>
                    <td><label><input name="myCheckbox" type="checkbox" value=""/>收藏副款</label></td>
                </tr>
                <tr>
                    <td><label><input name="myCheckbox" type="checkbox" value=""/>收藏店铺</label></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><b>付款信息</b></td>
                </tr>
                <tr>
                    <td>银行卡号；</td>
                    <td><input id="bankcard" class="easyui-combobox" name="bankcard"
                               data-options="required:true,valueField:'bankNum',textField:'bankNum',url:'${path}/bankcard/getBankCards',panelHeight:'auto'"/>
                    </td>
                    <td>货款金额</td>
                    <td><input id="payment" type="text" class="easyui-numberbox"
                               data-options="min:0,precision:2,required:true"/></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><b>订单信息</b></td>
                </tr>
                <tr>
                    <td>订单编号：</td>
                    <td><input id="orderNum" class="easyui-validatebox" data-options="required:true"/></td>
                    <td><label><input name="myCheckbox" type="checkbox" value=""/>下单已备注</label></td>
                    <td>IP：<input id="completeip" name="completeip" class="easyui-validatebox"
                                  data-options="required:true"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>