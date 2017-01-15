<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#typeEditForm').form({
            url: '${path }/type/edit',
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
        <form id="typeEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>分类名称</td>
                    <td>
                        <input name="id" value="${type.id}" hidden>
                        <input name="text" type="text" class="easyui-validatebox"
                               data-options="required:true" value="${type.text}"></td>
                    <td>备注</td>
                    <td><input name="mark" type="text" class="easyui-validatebox" value="${type.mark}"></td>
                </tr>

            </table>
        </form>
    </div>
</div>