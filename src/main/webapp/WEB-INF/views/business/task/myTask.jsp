<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var myTaskDataGrid;
    $(function () {
        myTaskDataGrid = $('#myTaskDataGrid').datagrid({
            url: '${path }/task/myDataGrid',
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
                        return "未完成";
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
                    str += $.formatString('<a href="javascript:void(0)" class="task-easyui-linkbutton-detail" data-options="plain:true,iconCls:\'fi-eye icon-blue\'" onclick="detailTaskFun(\'{0}\');" >详细</a>', row.id);
                    if (row.state == '1') {
                        str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                        str += '<a href="javascript:void(0)" class="task-easyui-linkbutton-check" data-options="plain:true,iconCls:\'fi-eye icon-blue\'" onclick="checkIPFun();" >检查IP</a>';
                        str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                        str += $.formatString('<a href="javascript:void(0)" class="task-easyui-linkbutton-execute" data-options="plain:true,iconCls:\'fi-check icon-blue\'" onclick="executeTaskFun(\'{0}\');" >执行</a>', row.id);
                    }
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.task-easyui-linkbutton-detail').linkbutton({text: '详细'});
                $('.task-easyui-linkbutton-execute').linkbutton({text: '执行'});
                $('.task-easyui-linkbutton-check').linkbutton({text: '检查IP'});
            },
            toolbar: '#taskToolbar'
        });
    });


    function detailTaskFun(id) {
        if (id == undefined) {
            var rows = myTaskDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            myTaskDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
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

    function executeTaskFun(id) {

    }

    function checkIPFun() {
        parent.$.modalDialog({
            title: '检查IP',
            width: 500,
            height: 320,
            href: '${path }/task/checkPage',
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.handler.dialog('close');
                }
            }]
        });
    }

    function searchTaskFun() {
        myTaskDataGrid.datagrid('load', $.serializeObject($('#searchMyTaskForm')));
    }
    function cleanTaskFun() {
        $('#searchMyTaskForm input').val('');
        myTaskDataGrid.datagrid('load', {});
    }
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchMyTaskForm">
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
        <table id="myTaskDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
