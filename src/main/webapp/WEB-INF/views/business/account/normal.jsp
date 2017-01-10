<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var accountDataGrid;

    $(function () {
        accountDataGrid = $('#accountDataGrid').datagrid({
            url: '${path }/user/dataGrid',
            fit: true,
            striped: true,
            rownumbers: true,
            pagination: true,
            singleSelect: true,
            idField: 'id',
            sortName: 'createTime',
            sortOrder: 'asc',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            columns: [[{
                width: '80',
                title: '账号',
                field: 'loginName',
                sortable: true
            }, {
                    field: 'action',
                    title: '操作',
                    width: 130,
                    formatter: function (value, row, index) {
                        var str = '';
                        <shiro:hasPermission name="/user/edit">
                        str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editUserFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/user/delete">
                        str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                        str += $.formatString('<a href="javascript:void(0)" class="account-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteUserFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                        return str;
                    }
                }]],
            onLoadSuccess: function (data) {
                $('.account-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.account-easyui-linkbutton-del').linkbutton({text: '删除'});
            },
            toolbar: '#userToolbar'
        });
    });

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAccountForm">
            <table>
                <tr>
                    <th>账号:</th>
                    <td><input name="name" placeholder="请输入用户姓名"/>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchAccountFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'账号列表'">
        <table id="accountDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>