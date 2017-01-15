<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var accountDataGridAbnormal;

    $(function () {
        accountDataGridAbnormal = $('#accountDataGridAbnormal').datagrid({
            url: '${path }/account/dataGridAbnormal',
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
                title: '异常原因',
                field: 'exceptionReason',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 200,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/account/recovery">
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-recovery" data-options="plain:true,iconCls:\'fi-check icon-blue\'" onclick="recoveryAccountFun(\'{0}\');" >恢复</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/account/deleab">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-del-ab" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteAccountFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>

                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.account-easyui-linkbutton-recovery').linkbutton({text: '恢复'});
                $('.account-easyui-linkbutton-del-ab').linkbutton({text: '删除'});
            }
        });
    });
    function recoveryAccountFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = accountDataGridAbnormal.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            accountDataGridAbnormal.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要将选中信息恢复正常？', function (b) {
            if (b) {
                progressLoad();
                $.post('${path }/account/recovery', {
                    id: id
                }, function (result) {
                    progressClose();
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        accountDataGridAbnormal.datagrid('reload');
                    }

                }, 'JSON');
            }
        });
    }

    function deleteAccountFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = accountDataGridAbnormal.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            accountDataGridAbnormal.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '标记删除',
            width: 500,
            height: 220,
            href: '${path }/account/delPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = accountDataGridAbnormal;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#accountDeleteForm');
                    f.submit();
                }
            }]
        });
    }
    function detailAccountFun(id) {
        if (id == undefined) {
            var rows = accountDataGridAbnormal.datagrid('getSelections');
            id = rows[0].id;
        } else {
            accountDataGridAbnormal.datagrid('unselectAll').datagrid('uncheckAll');
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

    function searchAbnormalAccountFun() {
        accountDataGridAbnormal.datagrid('load', $.serializeObject($('#searchAccountFormAbnormal')));
    }
    function cleanAbnormalAccountFun() {
        $('#searchAccountFormAbnormal input').val('');
        accountDataGridAbnormal.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAccountFormAbnormal">
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
                           data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchAbnormalAccountFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanAbnormalAccountFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'异常账号列表'">
        <table id="accountDataGridAbnormal" data-options="fit:true,border:false"></table>
    </div>
</div>
