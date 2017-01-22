<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        if ('${task.farmingType}' == '0') {
            $("#farmingType").append("开启")
        } else {
            $("#farmingType").append("关闭")
        }
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="taskEditForm" method="post">
            <table class="grid">
                <tr>
                    <td width="20%">商品编号</td>
                    <td>${task.goodsNum}</td>
                    <td width="20%">下单方式</td>
                    <td>
                        <span id="farmingType"></span>
                    </td>
                </tr>
                <tr>
                    <td>关键词</td>
                    <td>${task.keyword}</td>
                    <td>备注</td>
                    <td>${task.mark}</td>
                </tr>
            </table>
        </form>
    </div>
</div>