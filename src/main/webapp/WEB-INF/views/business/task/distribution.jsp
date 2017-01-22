<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#distributionForm').form({
            url: '${path }/task/distribution',
            onSubmit: function (param) {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                var name = $("#userId").combobox('getText');
                var rows = taskDataGrid.datagrid('getSelections');
                var ids = new Array();
                for (var i = 0; i < rows.length; i++) {
                    ids.push(rows[i].id);
                }
                param.name = name;
                param.ids = ids;
                return isValid;
            },
            success: function (result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.openner_dataGrid.datagrid('clearSelections');
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
        <form id="distributionForm" method="post">
            <table class="grid">
                <tr>
                    <td>分配人员</td>
                    <td>

                        <input id="userId" name="userId" type="text" class="easyui-combobox"
                               data-options="required:true,valueField: 'id',textField: 'name',url: '${path }/user/getUsersByType?type=1'">
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>