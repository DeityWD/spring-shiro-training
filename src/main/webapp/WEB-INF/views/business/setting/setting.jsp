<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#settingEditForm').form({
            url: '${path }/setting/edit',
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
                    parent.$.messager.alert('提示', result.msg, 'info');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
    function submitSetting() {
        $('#settingEditForm').submit();
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="settingEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>同店疲劳度（天）</td>
                    <td><input name="id" value="${setting.id}" hidden>
                        <input id="limitShop" name="limitShop" type="text"
                               class="easyui-numberbox"
                               data-options="required:true"
                               value="${setting.limitShop}"></td>
                    <td>同商品疲劳度（天）</td>
                    <td><input id="limitGood" name="limitGood" type="text"
                               class="easyui-numberbox"
                               data-options="required:true" value="${setting.limitGood}"></td>
                </tr>
                <tr>
                    <td>月购买数量疲劳度（件）</td>
                    <td><input id="limitNumber" name="limitNumber" type="text"
                               class="easyui-numberbox"
                               data-options="required:true"
                               value="${setting.limitNumber}"></td>
                    <td>月购买金额疲劳度（元）</td>
                    <td><input id="limitMoney" name="limitMoney" type="text"
                               class="easyui-numberbox"
                               data-options="required:true" value="${setting.limitMoney}"></td>
                </tr>
                <tr>
                <td>IP疲劳度（小时）</td>
                <td><input id="limitIp" name="limitIp" type="text"
                           class="easyui-numberbox"
                           data-options="required:true"
                           value="${setting.limitIp}"></td>
                <td>分类疲劳度（天）</td>
                <td><input id="limitType" name="limitType" type="text"
                           class="easyui-numberbox"
                           data-options="required:true" value="${setting.limitType}"></td>
                </tr>
                <tr>
                    <td>收货间隔天数（天）</td>
                    <td><input id="limitReceiptDay" name="limitReceiptDay" type="text"
                               class="easyui-numberbox"
                               data-options="required:true"
                               value="${setting.limitReceiptDay}"></td>
                    <td>注册天数限制（天）</td>
                    <td><input id="limitRegisterDay" name="limitRegisterDay" type="text"
                               class="easyui-numberbox"
                               data-options="required:true" value="${setting.limitRegisterDay}"></td>
                </tr>
                <tr>
                    <td colspan=4 align="center">
                        <a id="btn" href="#" onclick="submitSetting()" class="easyui-linkbutton" data-options="iconCls:'fi-save'">提交</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>