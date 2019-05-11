<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<table class="easyui-datagrid" data-options="url:'cp.html'">--%>
<%--<thead>--%>
<%--<tr>--%>
<%--<th data-options="field:'id',width:60">ID</th>--%>
<%--<th data-options="field:'name',width:80">Name</th>--%>
<%--<th data-options="field:'secretKey',width:80">secretKey</th>--%>
<%--<th data-options="field:'noticeKey',width:80">noticeKey</th>--%>
<%--<th data-options="field:'password',width:80">password</th>--%>
<%--<th data-options="field:'status',width:100">状态</th>--%>
<%--<th data-options="field:'createdDate'">日期</th>--%>
<%--</tr>--%>
<%--</thead>--%>
<%--</table>--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editCp()">修改</a>
</div>

<table id="game-table">

</table>
<script type="text/javascript">
    $(function () {
        $("#game-table").datagrid({
            url:'list.html',
            pagination:"true",//分页
            pageSize:2,//默认初始化尺寸是10，不管是几，pageSize必须是pageList中的值
            pageList:[2,3,4,5,6,7,8],
            columns: [[
                {field:'id',title:'编号',width:100},
                {field:'name',title:'公司名称',width:100},
                {field:'secretKey',title:'保密锁',width:100},
                {field:'noticeKey',title:'通知锁🔒',width:100},
                {field:'password',title:'密码',width:100},
                {field:'status',title:'状态',width:100, formatter:function(value,row){
                    if (value==1){
                        return '有效';
                    }else {
                        return '无效';
                    }
                }},
                {field:'createdDate',title:'创建时间',width:100},
            ]]
        })
        var pager = $('#game-table').datagrid().datagrid('getPager');
        pager.pagination({
            layout:['list','sep','first','links','last']
        })
    })
    function editCp() {
        var row = $("#game-table").datagrid("getSelected");
        if (row == null) {
            return;
        }
        var div = $("<div></div>");
        $(div).dialog({
            title: '编辑信息',
            width: 500,
            height: 400,
            closed: false,
            href: 'go_update.html?id='+row.id,
            modal: true,
            onClose:function(){
                $(div).dialog("destroy");//dialog在关闭的时候必须销毁
            },
            buttons: [{
                iconCls: "icon-ok",
                text: '保存',
                handler: function () {
                    $.ajax({
                        url: 'update.html',
                        data: $("#edit-form").serialize(),
                        method: 'post',
                        success: function (json) {
                            if (json == "ok") {
                                $("#game-table").datagrid("reload");
                                $(div).dialog("destroy");
                            }
                        }
                    })
                }
            }, {
                text: '取消',
                handler: function () {
                    $(div).dialog("destroy")
                }
            }]
        });

    }
</script>