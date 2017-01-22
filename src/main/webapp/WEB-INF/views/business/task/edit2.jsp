<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#taskEditForm').form({
            url: '${path }/task/edit',
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
        $("#showPicture").val("${task.showPicture}");
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="taskEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>订单编号</td>
                    <td><input name="orderNum" type="text" class="easyui-validatebox"
                               data-options="required:true" value="${task.orderNum}"></td>
                    <td>评价内容</td>
                    <td><input name="evaluateWorld" class="easyui-validatebox" value="${task.evaluateWorld}"></td>
                </tr>
                <tr>
                    <td>是否晒图</td>
                    <td>
                        <select id="showPicture" name="showPicture" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                    <td>图片名称</td>
                    <td><input name="picture" class="easyui-validatebox" value="${task.picture}"></td>
                </tr>
                <tr hidden>
                    <td><input hidden name="id" value="${task.id}"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</div>