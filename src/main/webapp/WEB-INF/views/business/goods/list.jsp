<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {

        $('#goodsDataGrid').edatagrid({
            url: '${path }/goods/dataGrid?shopId=${shopId}',
            saveUrl: '${path }/goods/add?shopId=${shopId}',
            updateUrl: '${path }/goods/edit',
            destroyUrl: '${path }/goods/delete',
            fit: true,
            striped: true,
            rownumbers: true,
            pagination: true,
            singleSelect: true,
            idField: 'id',
            sortOrder: 'asc',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            columns: [[{
                width: '150',
                title: '商品编号',
                field: 'goodsNum',
                sortable: true,
                editor: {type: 'validatebox', options: {required: true}}
            }, {
                width: '150',
                title: '商品名称',
                field: 'goodsName',
                sortable: true,
                editor: {type: 'validatebox', options: {required: true}}
            }, {
                width: '80',
                title: '商品价格',
                field: 'price',
                sortable: true,
                editor: {type: 'numberbox', options: {required: true, precision: 2}}
            }, {
                width: '100',
                title: '商品分类',
                field: 'type',
                sortable: true,
                editor: {
                    type: 'combobox',
                    options: {
                        required: true,
                        valueField: 'id',
                        textField: 'text',
                        url: '${path }/type/getTypes'
                    }
                },
                formatter: function (value, row, index) {
                    return formatType(value);
                }
            }, {
                width: '120',
                title: '分类疲劳度',
                field: 'typeLimit',
                editor: {
                    type: 'combobox',
                    options: {
                        required: true,
                        valueField: 'val',
                        textField: 'text',
                        data: [{val: '0', text: '开启'}, {val: '1', text: '关闭'}]
                    }
                },
                formatter: function (value, row, index) {
                    return formatTypeLimit(value);
                }
            }, {
                width: '150',
                title: '备注',
                field: 'mark',
                sortable: true,
                editor: {type: 'text'}
            }, {
                title: '店铺ID',
                field: 'shopId',
                hidden: true
            }]],
            toolbar: '#goodsToolbar',
            onError: function (index, row) {
                alert(row.msg);
            },
            onSave: function (index, row) {
                $('#goodsDataGrid').edatagrid('reload');
            },
            destroyMsg: {
                norecord: {
                    title: 'Warning',
                    msg: '未选中要删除的信息.'
                },
                confirm: {	// when select a row
                    title: 'Confirm',
                    msg: '确定要删除选中的信息?'
                }
            }
        });
    });
    function formatTypeLimit(value) {
        if (value == '0')
            return "开启";
        else
            return "关闭";
    }
    function formatType(value) {
        var type = "";
        if (value != null && value != '') {
            $.ajax({
                url: '${path }/type/getType',
                type: "post",
                data: "id=" + value,
                dataType: "json",
                cache: false,
                async: false,
                success: function (data) {
                    type = data.text;
                }
            });
        }
        return type;
    }
    function addGoodsFun() {
        $('#goodsDataGrid').edatagrid('addRow');
    }
    function saveGoodsFun() {
        $('#goodsDataGrid').edatagrid('saveRow');
    }
    function deleteGoodsFun() {
        $('#goodsDataGrid').edatagrid('destroyRow');
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:true,title:'商品列表'">
        <table id="goodsDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="goodsToolbar" style="display: none;">
    <a onclick="addGoodsFun();" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    &nbsp;&nbsp;|&nbsp;&nbsp;
    <a onclick="saveGoodsFun();" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="plain:true,iconCls:'fi-save icon-green'">保存</a>
    &nbsp;&nbsp;|&nbsp;&nbsp;
    <a onclick="deleteGoodsFun();" href="javascript:void(0);" class="easyui-linkbutton"
       data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
    &nbsp;&nbsp;|&nbsp;&nbsp;
    <span>双击记录可进行编辑操作</span>
</div>
