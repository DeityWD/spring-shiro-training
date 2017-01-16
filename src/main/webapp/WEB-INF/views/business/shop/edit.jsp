<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#shopEditForm').form({
            url: '${path }/shop/edit',
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
        $("#receiptType").val('${shop.receiptType}');
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="shopEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>店铺名称</td>
                    <td><input hidden name="id" value="${shop.id}"><input name="shopName" type="text"
                                                                          class="easyui-validatebox"
                                                                          data-options="required:true"
                                                                          value="${shop.shopName}"></td>
                    <td>合作时间</td>
                    <td><input name="cooperateDate" class="easyui-datetimebox" value="${shop.cooperateDate}"/></td>
                </tr>
                <tr>
                    <td>APP下单佣金</td>
                    <td><input name="commissionFarmingApp" class="easyui-numberbox"
                               value="${shop.commissionFarmingApp}"></td>
                    <td>PC下单佣金</td>
                    <td><input name="commissionFarmingPc" class="easyui-numberbox" value="${shop.commissionFarmingPc}">
                    </td>
                </tr>
                <tr>
                    <td>收货且评价佣金</td>
                    <td><input name="commissionReceiptEvaluate" class="easyui-numberbox"
                               value="${shop.commissionReceiptEvaluate}"></td>
                    <td>收货佣金</td>
                    <td><input name="commissionReceipt" class="easyui-numberbox" value="${shop.commissionReceipt}"></td>
                </tr>
                <tr>
                    <td>评价佣金</td>
                    <td><input name="commissionEvaluate" class="easyui-numberbox" value="${shop.commissionReceipt}">
                    </td>
                    <td>收货类型</td>
                    <td>
                        <select id="receiptType" name="receiptType" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">任务收货</option>
                            <option value="1">自由收货</option>
                        </select>
                    </td>
                </tr>
            </table>
            </table>
        </form>
    </div>
</div>