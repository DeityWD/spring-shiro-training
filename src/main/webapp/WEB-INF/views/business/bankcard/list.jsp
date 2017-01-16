<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var bankcardDataGrid;

    $(function () {
        bankcardDataGrid = $('#bankcardDataGrid').datagrid({
            url: '${path }/bankcard/dataGrid',
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
                title: '银行名称',
                field: 'bankName',
                sortable: true
            }, {
                width: '200',
                title: '银行卡号',
                field: 'bankNum',
                sortable: true
            }, {
                width: '150',
                title: '密码',
                field: 'password',
                sortable: true
            },{
                width: '200',
                title: '备注',
                field: 'mark',
                sortable: true
            },  {
                field: 'action',
                title: '操作',
                width: 280,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/bankcard/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="bankcard-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editBankCardFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/bankcard/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="bankcard-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteBankCardFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>

                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.bankcard-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.bankcard-easyui-linkbutton-del').linkbutton({text: '删除'});
            },
            toolbar: '#bankCardToolbar'
        });
    });

    function addBankCardFun() {
        parent.$.modalDialog({
            title: '添加',
            width: 500,
            height: 250,
            href: '${path }/bankcard/addPage',
            buttons: [{
                text: '添加',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = bankcardDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#banCardAddForm');
                    f.submit();
                }
            }]
        });
    }

    function editBankCardFun(id) {
        if (id == undefined) {
            var rows = bankcardDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            bankcardDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '编辑',
            width: 500,
            height: 320,
            href: '${path }/bankcard/editPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = bankcardDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#bankCardEditForm');
                    f.submit();
                }
            }]
        });
    }

    function deleteBankCardFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = bankcardDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            bankcardDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前分类？', function (b) {
                    if (b) {
                        progressLoad();
                        $.post('${path }/bankcard/delete', {
                            id: id
                        }, function (result) {
                            if (result.success) {
                                parent.$.messager.alert('提示', result.msg, 'info');
                                bankcardDataGrid.datagrid('reload');
                            }
                            progressClose();
                        }, 'JSON');
                    }
                }
        );
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:true,title:'分类列表'">
        <table id="bankcardDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="bankCardToolbar" style="display: none;">
    <shiro:hasPermission name="/bankcard/add">
        <a onclick="addBankCardFun();" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>