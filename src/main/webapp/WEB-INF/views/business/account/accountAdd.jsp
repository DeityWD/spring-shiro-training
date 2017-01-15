<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#accountAddForm').form({
            url : '${path }/account/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="accountAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>账号</td>
                    <td><input name="userName" type="text" placeholder="请输入账号" class="easyui-validatebox"
                               data-options="required:true" value=""></td>
                    <td>登陆密码</td>
                    <td><input name="passwordLogin" type="text" placeholder="请输入登录密码" class="easyui-validatebox"
                               data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>支付密码</td>
                    <td><input name="passwordPay" type="text" placeholder="请输入支付密码" class="easyui-validatebox"
                               data-options="required:true" value=""></td>
                    <td>所属地区</td>
                    <td><input name="area" type="text" placeholder="请输入所属地区" class="easyui-validatebox"
                               data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>绑定邮箱</td>
                    <td><input name="email" type="text" placeholder="请输入绑定邮箱" class="easyui-validatebox" value=""></td>
                    <td>邮箱密码</td>
                    <td><input name="passwordEmail" type="text" placeholder="请输入邮箱密码" class="easyui-validatebox"
                               value=""></td>
                </tr>
                <tr>
                    <td>运营商</td>
                    <td>
                        <select name="operator" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="联通">联通</option>
                            <option value="电信">电信</option>
                            <option value="移动">移动</option>
                        </select>
                    </td>
                    <td>账号等级</td>
                    <td>
                        <select name="level" class="easyui-combobox"
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
                    <td><input name="personId" type="text" class="easyui-validatebox" value=""></td>
                    <td>人员姓名</td>
                    <td><input name="personName" type="text" class="easyui-validatebox" value=""></td>
                </tr>
                <tr>
                    <td>绑定手机号</td>
                    <td><input name="phone" type="text" class="easyui-validatebox" value=""></td>
                    <td>收货地址</td>
                    <td><input name="address" type="text" class="easyui-validatebox" value=""></td>
                </tr>
                <tr>
                    <td>注册日期</td>
                    <td>
                        <input name="registerDate" placeholder="点击选择时间"
                               onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</div>