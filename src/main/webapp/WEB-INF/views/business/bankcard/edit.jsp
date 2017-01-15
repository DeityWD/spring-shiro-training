<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#bankCardEditForm').form({
            url: '${path }/bankcard/edit',
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
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="bankCardEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>银行名称</td>
                    <td><input hidden name="id" value="${bankCard.id}"><input name="bankName" type="text" class="easyui-validatebox"
                                                       data-options="required:true" value="${bankCard.bankName}"></td>
                    <td>银行卡号</td>
                    <td><input name="bankNum" type="text" class="easyui-validatebox"
                               data-options="required:true" value="${bankCard.bankNum}"></td>
                </tr>
                <tr>
                    <td>银行密码</td>
                    <td><input name="password" type="text" class="easyui-validatebox"
                               data-options="required:true" value="${bankCard.password}"></td>
                    <td>备注</td>
                    <td><input name="mark" type="text" class="easyui-validatebox" value="${bankCard.mark}"></td>
                </tr>

            </table>
        </form>
    </div>
</div>