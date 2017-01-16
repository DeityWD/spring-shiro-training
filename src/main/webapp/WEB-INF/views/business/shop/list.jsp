<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var shopDataGrid;

    $(function () {
        shopDataGrid = $('#shopDataGrid').datagrid({
            url: '${path }/shop/dataGrid',
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
                title: '店铺名称',
                field: 'shopName',
                sortable: true
            }, {
                width: '80',
                title: '所欠货款',
                field: 'payment',
                sortable: true
            }, {
                width: '80',
                title: '所欠佣金',
                field: 'commission',
                sortable: true
            }, {
                width: '80',
                title: 'APP下单佣金',
                field: 'commissionFarmingApp',
                sortable: true
            }, {
                width: '80',
                title: 'PC下单佣金',
                field: 'commissionFarmingPc',
                sortable: true
            }, {
                width: '100',
                title: '收货且评价佣金',
                field: 'commissionReceiptEvaluate',
                sortable: true
            }, {
                width: '70',
                title: '收货佣金',
                field: 'commissionReceipt',
                sortable: true
            }, {
                width: '70',
                title: '评价佣金',
                field: 'commissionEvaluate',
                sortable: true
            }, {
                width: '80',
                title: '收货类型',
                field: 'receiptType',
                formatter: function (value, row, index) {
                    if (value == '0') {
                        return "任务收货";
                    } else if (value == '1') {
                        return "自由收货";
                    }
                }
            }, {
                width: '150',
                title: '合作时间',
                field: 'cooperateDate',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 230,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/shop/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="shop-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editShopFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/shop/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="shop-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteShopFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="shop-easyui-linkbutton-good" data-options="plain:true,iconCls:\'fi-database icon-blue\'" onclick="showGoodFun(\'{0}\');" >商品</a>', row.id);
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.shop-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.shop-easyui-linkbutton-del').linkbutton({text: '删除'});
                $('.shop-easyui-linkbutton-good').linkbutton({text: '商品'});
            },
            toolbar: '#shopToolbar'
        });
    });

    function addShopFun() {
        parent.$.modalDialog({
            title: '添加',
            width: 500,
            height: 250,
            href: '${path }/shop/addPage',
            buttons: [{
                text: '添加',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = shopDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#shopAddForm');
                    f.submit();
                }
            }]
        });
    }

    function editShopFun(id) {
        if (id == undefined) {
            var rows = shopDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            shopDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '编辑',
            width: 500,
            height: 320,
            href: '${path }/shop/editPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = shopDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#shopEditForm');
                    f.submit();
                }
            }]
        });
    }

    function deleteShopFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = shopDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            shopDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前分类？', function (b) {
                    if (b) {
                        progressLoad();
                        $.post('${path }/shop/delete', {
                            id: id
                        }, function (result) {
                            if (result.success) {
                                parent.$.messager.alert('提示', result.msg, 'info');
                                shopDataGrid.datagrid('reload');
                            }
                            progressClose();
                        }, 'JSON');
                    }
                }
        );
    }
    function showGoodFun(id) {
        parent.$.modalDialog({
            title: '商品列表',
            width: 800,
            height: 500,
            href: '${path }/shop/goodsPage?id=' + id
        });
    }
    function searchShopFun() {
        shopDataGrid.datagrid('load', $.serializeObject($('#searchShopForm')));
    }
    function cleanShopFun() {
        $('#searchShopForm input').val('');
        shopDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchShopForm">
            <table>
                <tr>
                    <th>店铺名称:</th>
                    <td><input name="shopName" placeholder="请输入店铺名称"/></td>

                    <th>收货类型:</th>
                    <td>
                        <select name="receiptType" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="">全部</option>
                            <option value="0">任务收货</option>
                            <option value="1">自由收货</option>
                        </select>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchShopFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanShopFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'店铺列表'">
        <table id="shopDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="shopToolbar" style="display: none;">
    <shiro:hasPermission name="/shop/add">
        <a onclick="addShopFun();" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>