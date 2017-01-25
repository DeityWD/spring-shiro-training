<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var accountListDataGrid;
    $(function () {
        accountListDataGrid = $('#accountListDataGrid').datagrid({
            url: '${path }/account/dataGrid',
            fit: true,
            striped: true,
            rownumbers: true,
            pagination: true,
            singleSelect: true,
            idField: 'id',
            sortName: 'createDate',
            sortOrder: 'asc',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            columns: [[{
                width: '140',
                title: '账号',
                field: 'userName',
                sortable: true
            }, {
                width: '90',
                title: '登陆密码',
                field: 'passwordLogin',
                sortable: true
            }, {
                width: '90',
                title: '支付密码',
                field: 'passwordPay',
                sortable: true
            }, {
                width: '170',
                title: '邮箱',
                field: 'email',
                sortable: true
            }, {
                width: '90',
                title: '邮箱密码',
                field: 'passwordEmail',
                sortable: true
            }, {
                width: '80',
                title: '所属地区',
                field: 'area',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 80,
                formatter: function (value, row, index) {
                    var str = '';
                    str += $.formatString('<a href="javascript:void(0)" class="accountList-easyui-linkbutton-detail" data-options="plain:true,iconCls:\'fi-heart icon-blue\'" onclick="useAccountFun(\'{0}\');" >使用</a>', row.id);
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.accountList-easyui-linkbutton-detail').linkbutton({text: '使用'});
            }
        });
    });

    function useAccountFun(id) {
        var taskId = $("#taskId").val();
        parent.parent.$.modalDialog.handler.dialog('close');
        parent.parent.$.modalDialog({
            title: '使用',
            width: 800,
            height: 550,
            href: '${path }/task/toExecuteTask?taskId='+taskId+'&accountId='+id,
            buttons: [{
                text: '完成任务',
                handler: function () {
                    var f = parent.$.modalDialog.handler.find('#executeTaskForm');
                    f.submit();
                }
            }]
        });
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <input id="taskId" name="taskId" value="${taskId}" hidden>
    <div data-options="region:'center',border:true,title:'账号列表'">
        <table id="accountListDataGrid" data-options="fit:true,border:false">

        </table>
    </div>
</div>