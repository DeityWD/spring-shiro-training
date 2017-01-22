<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var taskDataGrid;
    $(function () {
        taskDataGrid = $('#taskDataGrid').datagrid({
            url: '${path }/task/dataGrid',
            fit: true,
            striped: true,
            rownumbers: true,
            pagination: true,
            idField: 'id',
            sortName: 'createDate',
            sortOrder: 'asc',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            columns: [[{
                field: 'ck',
                checkbox: true
            }, {
                width: '120',
                title: '类型',
                field: 'type',
                sortable: true,
                formatter: function (value, row, index) {
                    if (value == '0') {
                        return "下单任务";
                    } else if (value == '1') {
                        return "收货且评价任务";
                    }
                    else if (value == '2') {
                        return "收货任务";
                    } else if (value == '3') {
                        return "评价任务";
                    }
                }
            }, {
                width: '120',
                title: '任务状态',
                field: 'state',
                sortable: true,
                formatter: function (value, row, index) {
                    if (value == '0') {
                        return "未分配";
                    } else if (value == '1') {
                        return "已分配";
                    }
                    else if (value == '2') {
                        return "已完成";
                    }
                }
            }, {
                width: '150',
                title: '创建时间',
                field: 'createTime',
                sortable: true
            }, {
                width: '150',
                title: '分配时间',
                field: 'assignTime',
                sortable: true
            }, {
                width: '150',
                title: '完成时间',
                field: 'completeTime',
                sortable: true
            }, {
                width: '120',
                title: '接收人',
                field: 'ownerName',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 220,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/task/detail">
                    str += $.formatString('<a href="javascript:void(0)" class="task-easyui-linkbutton-detail" data-options="plain:true,iconCls:\'fi-eye icon-blue\'" onclick="detailTaskFun(\'{0}\');" >详细</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/task/edit">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="task-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editTaskFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/task/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="task-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteTaskFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.task-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.task-easyui-linkbutton-del').linkbutton({text: '删除'});
                $('.task-easyui-linkbutton-detail').linkbutton({text: '详细'});
            },
            toolbar: '#taskToolbar'
        });
    });

    function addTaskFun(type) {
        parent.$.modalDialog({
            title: '添加',
            width: 500,
            height: 250,
            href: '${path }/task/addPage?type=' + type,
            buttons: [{
                text: '添加',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = taskDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#taskAddForm');
                    f.submit();
                }
            }]
        });
    }
    function editTaskFun(id) {
        if (id == undefined) {
            var rows = taskDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            taskDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '编辑',
            width: 500,
            height: 320,
            href: '${path }/task/editPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = taskDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#taskEditForm');
                    f.submit();
                }
            }]
        });
    }
    function deleteTaskFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = taskDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            taskDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前分类？', function (b) {
                    if (b) {
                        progressLoad();
                        $.post('${path }/task/delete', {
                            id: id
                        }, function (result) {
                            if (result.success) {
                                parent.$.messager.alert('提示', result.msg, 'info');
                                taskDataGrid.datagrid('reload');
                            }
                            progressClose();
                        }, 'JSON');
                    }
                }
        );
    }

    function detailTaskFun(id) {
        if (id == undefined) {
            var rows = taskDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            taskDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '详细',
            width: 500,
            height: 320,
            href: '${path }/task/detailPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.handler.dialog('close');
                }
            }]
        });
    }

    function distributTaskFun() {
        var rows = taskDataGrid.datagrid('getSelections');
        if (rows.length == 0) {
            parent.$.messager.alert('提示', '请选择要分配的任务！', 'info');
            return;
        }
        for (var i = 0; i < rows.length; i++) {
            if (rows[i].state != '0') {
                parent.$.messager.alert('提示', '请选择未分配的任务！', 'info');
                taskDataGrid.datagrid('clearSelections');
                return;
            }
        }
        parent.$.modalDialog({
            title: '分配',
            width: 500,
            height: 250,
            href: '${path }/task/distributionPage',
            buttons: [{
                text: '添加',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = taskDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#distributionForm');
                    f.submit();
                }
            }]
        });

    }

    function searchTaskFun() {
        taskDataGrid.datagrid('load', $.serializeObject($('#searchTaskForm')));
    }
    function cleanTaskFun() {
        $('#searchTaskForm input').val('');
        taskDataGrid.datagrid('load', {});
    }
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchTaskForm">
            <table>
                <tr>
                    <th>商品编号:</th>
                    <td><input name="goodsNum" placeholder="请输入商品编号"/></td>

                    <th>任务类型:</th>
                    <td>
                        <select name="type" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="">全部</option>
                            <option value="0">下单任务</option>
                            <option value="1">收货且评价</option>
                            <option value="0">收货任务</option>
                            <option value="1">评价任务</option>
                        </select>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchTaskFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanTaskFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'任务列表'">
        <table id="taskDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="taskToolbar" style="display: none;">
    <shiro:hasPermission name="/task/add">
        <a href="javascript:void(0);" class="easyui-menubutton"
           data-options="menu:'#mm',plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>

    <shiro:hasPermission name="/task/distribution">
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a onclick="distributTaskFun();" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'fi-torso icon-green'">分配</a>
    </shiro:hasPermission>
</div>

<div id="mm" style="width:150px;">
    <div data-options="iconCls:'fi-arrow-right'" onclick="addTaskFun(1)">刷单任务</div>
    <div data-options="iconCls:'fi-arrow-right'" onclick="addTaskFun(2)">收货且评价任务</div>
    <div data-options="iconCls:'fi-arrow-right'" onclick="addTaskFun(3)">收货任务</div>
    <div data-options="iconCls:'fi-arrow-right'" onclick="addTaskFun(4)">评价任务</div>
</div>