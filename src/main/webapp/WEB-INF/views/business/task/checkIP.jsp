<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {

    });
    function checkIP() {
        var isValid = $("#taskCheckForm").form('validate');
        if (!isValid) {
            return isValid;
        }
        progressLoad();
        var ip = $("#ip").val();
        $.post('${path }/task/checkIP', {
            ip: ip
        }, function (result) {
            if (result.success) {
                parent.$.messager.alert('提示', result.msg, 'info');
            }
            progressClose();
        }, 'JSON');

    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="taskCheckForm" method="post">
            <table class="grid">
                <tr>
                    <td>IP地址</td>
                    <td><input id="ip" name="ip" type="text" class="easyui-validatebox"
                               data-options="required:true" value=""></td>
                    <td colspan="2">
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkIP();">检查IP</a>
                    </td>
                    <td>

                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>