<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#accountDeleteForm').form({
            url: '${path }/account/delete',
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

    });
</script>
<%@ page isELIgnored="false" %>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="accountDeleteForm" method="post">
            <table class="grid">
                <tr>
                    <td>删除原因</td><td><textarea name="deleteReason" style="width: 300px"></textarea></td>
                </tr>
                <tr>
                    <td><input name="id" value="${account.id}" hidden></td>
                </tr>
            </table>
        </form>
    </div>
</div>