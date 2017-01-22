<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {

    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="taskEditForm" method="post">
            <table class="grid">
                <tr>
                    <td width="20%">订单编号</td>
                    <td>${task.orderNum}</td>
                </tr>
            </table>
        </form>
    </div>
</div>