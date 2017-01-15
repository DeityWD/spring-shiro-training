<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $("#operator").val('${account.operator}');
        $("#level").val('${account.level}');
    });
</script>
<%@ page isELIgnored="false" %>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="accountDetailForm" method="post">
            <table class="grid">
                <tr>
                    <td>账号</td>
                    <td><input name="id" value="${account.id}" hidden>${account.userName}</td>
                    <td>登陆密码</td>
                    <td width="120px">${account.passwordLogin}</td>
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
                    <td>${account.operator}</td>
                    <td>账号等级</td>
                    <td>${account.level}</td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td>${account.personId}</td>
                    <td>人员姓名</td>
                    <td>${account.personName}</td>
                </tr>
                <tr>
                    <td>绑定手机号</td>
                    <td>${account.phone}</td>
                    <td>收货地址</td>
                    <td>${account.address}</td>
                </tr>
                <tr>
                    <td>注册日期</td>
                    <td>${account.registerDate}</td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</div>