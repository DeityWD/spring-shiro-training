<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#accountEditForm').form({
            url: '${path }/account/edit',
            onSubmit: function () {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success: function (result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        $("#operator").val('${account.operator}');
        $("#level").val('${account.level}');
    });
</script>
<%@ page isELIgnored="false" %>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="accountEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>账号</td>
                    <td><input name="id" value="${account.id}" hidden><input id="userName" name="userName" type="text"
                                                                             placeholder="请输入账号"
                                                                             class="easyui-validatebox"
                                                                             data-options="required:true"
                                                                             value="${account.userName}"></td>
                    <td>登陆密码</td>
                    <td><input id="passwordLogin" name="passwordLogin" type="text" placeholder="请输入登录密码"
                               class="easyui-validatebox"
                               data-options="required:true" value="${account.passwordLogin}"></td>
                </tr>
                <tr>
                    <td>支付密码</td>
                    <td><input id="passwordPay" name="passwordPay" type="text" placeholder="请输入支付密码"
                               class="easyui-validatebox"
                               data-options="required:true" value="${account.passwordPay}"></td>
                    <td>所属地区</td>
                    <td><input id="area" name="area" type="text" placeholder="请输入所属地区" class="easyui-validatebox"
                               data-options="required:true" value="${account.area}"></td>
                </tr>
                <tr>
                    <td>绑定邮箱</td>
                    <td><input id="email" name="email" type="text" placeholder="请输入绑定邮箱" class="easyui-validatebox"
                               value="${account.email}"></td>
                    <td>邮箱密码</td>
                    <td><input id="passwordEmail" name="passwordEmail" type="text" placeholder="请输入邮箱密码"
                               class="easyui-validatebox"
                               value="${account.passwordEmail}"></td>
                </tr>
                <tr>
                    <td>运营商</td>
                    <td>
                        <select id="operator" name="operator" class="easyui-combobox" value="${account.operator}"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="联通">联通</option>
                            <option value="电信">电信</option>
                            <option value="移动">移动</option>
                        </select>
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
                    <td>注册日期</td>
                    <td>
                        <input id="registerDate" name="registerDate" value="${account.registerDate}"
                               class="easyui-datetimebox" data-options="required:true"/>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</div>