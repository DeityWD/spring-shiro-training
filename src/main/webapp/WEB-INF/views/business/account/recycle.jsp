<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var accountDataGridRecycle;

    $(function () {
        accountDataGridRecycle = $('#accountDataGridRecycle').datagrid({
            url: '${path }/account/dataGridRecycle',
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
                width: '150',
                title: '账号',
                field: 'userName',
                sortable: true
            }, {
                width: '100',
                title: '登陆密码',
                field: 'passwordLogin',
                sortable: true
            }, {
                width: '100',
                title: '支付密码',
                field: 'passwordPay',
                sortable: true
            }, {
                width: '180',
                title: '邮箱',
                field: 'email',
                sortable: true
            }, {
                width: '100',
                title: '邮箱密码',
                field: 'passwordEmail',
                sortable: true
            }, {
                width: '80',
                title: '所属地区',
                field: 'area',
                sortable: true
            }, {
                width: '200',
                title: '删除原因',
                field: 'deleteReason',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 200,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/account/excepre">
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-excepre" data-options="plain:true,iconCls:\'fi-info icon-red\'" onclick="excepAccountFun(\'{0}\');" >异常</a>', row.id);
                    </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.account-easyui-linkbutton-excepre').linkbutton({text: '标为异常'});
            }
        });
    });
    function excepAccountFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = accountDataGridRecycle.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            accountDataGridRecycle.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '标记异常',
            width: 500,
            height: 220,
            href: '${path }/account/excepPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = accountDataGridRecycle;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountExcepForm');
                    f.submit();
                }
            }]
        });
    }
    function detailAccountFun(id) {
        if (id == undefined) {
            var rows = accountDataGridRecycle.datagrid('getSelections');
            id = rows[0].id;
        } else {
            accountDataGridRecycle.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '详细',
            width: 500,
            height: 320,
            href: '${path }/account/detailPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.handler.dialog('close');
                }
            }]
        });
    }

    function searchRecycleAccountFun() {
        accountDataGridRecycle.datagrid('load', $.serializeObject($('#searchAccountFormRecycle')));
    }
    function cleanRecycleAccountFun() {
        $('#searchAccountFormRecycle input').val('');
        accountDataGridRecycle.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAccountFormRecycle">
            <table>
                <tr>
                    <th>账号:</th>
                    <td><input name="userName" placeholder="请输入账号"/></td>
                    <th>地区:</th>
                    <td><input name="area" placeholder="请输入所属地区"/></td>
                    <th>邮箱:</th>
                    <td>
                        <input name="email" placeholder="请输入邮箱"/>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchRecycleAccountFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanRecycleAccountFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'删除账号列表'">
        <table id="accountDataGridRecycle" data-options="fit:true,border:false"></table>
    </div>
</div>
