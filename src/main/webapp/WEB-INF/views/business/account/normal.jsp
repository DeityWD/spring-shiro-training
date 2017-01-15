<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var accountDataGrid;

    $(function () {
        accountDataGrid = $('#accountDataGrid').datagrid({
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
                width: '130',
                title: '注册日期',
                field: 'registerDate',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 280,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/account/detail">
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-detail" data-options="plain:true,iconCls:\'fi-eye icon-blue\'" onclick="detailAccountFun(\'{0}\');" >详细</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/account/edit">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editAccountFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/account/excep">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-excep" data-options="plain:true,iconCls:\'fi-info icon-red\'" onclick="excepAccountFun(\'{0}\');" >异常</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/account/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteAccountFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>

                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.account-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.account-easyui-linkbutton-del').linkbutton({text: '删除'});
                $('.account-easyui-linkbutton-detail').linkbutton({text: '详细'});
                $('.account-easyui-linkbutton-excep').linkbutton({text: '异常'});
            },
            toolbar: '#accountToolbar'
        });
    });
    function addAccountFun() {
        parent.$.modalDialog({
            title: '添加',
            width: 500,
            height: 350,
            href: '${path }/account/addPage',
            buttons: [{
                text: '添加',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = accountDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountAddForm');
                    f.submit();
                }
            }]
        });
    }
    function editAccountFun(id) {
        if (id == undefined) {
            var rows = accountDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            accountDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '编辑',
            width: 500,
            height: 320,
            href: '${path }/account/editPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = accountDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountEditForm');
                    f.submit();
                }
            }]
        });
    }
    function deleteAccountFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = accountDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            accountDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '标记删除',
            width: 500,
            height: 220,
            href: '${path }/account/delPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = accountDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountDeleteForm');
                    f.submit();
                }
            }]
        });
    }
    function detailAccountFun(id) {
        if (id == undefined) {
            var rows = accountDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            accountDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
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
    function excepAccountFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = accountDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            accountDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '标记异常',
            width: 500,
            height: 220,
            href: '${path }/account/excepPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = accountDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountExcepForm');
                    f.submit();
                }
            }]
        });
    }
    function searchAccountFun() {
        accountDataGrid.datagrid('load', $.serializeObject($('#searchAccountForm')));
    }
    function cleanAccountFun() {
        $('#searchAccountForm input').val('');
        accountDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAccountForm">
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
                           data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchAccountFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanAccountFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'账号列表'">
        <table id="accountDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="accountToolbar" style="display: none;">
    <shiro:hasPermission name="/account/add">
        <a onclick="addAccountFun();" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>