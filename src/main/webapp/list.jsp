<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <script type="text/javascript" src="jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height: 100px;">TOP</div>
<div data-options="region:'west'" style="width:200px;">菜单

    <ul id="ul-tree" class="easyui-tree">
        <li>
            <span>Folder</span>
            <ul>
                <li>
                    <span>Sub Folder 1</span>
                    <ul>
                        <li data-options="attributes:{url:'update.jsp'}"><span><a href="#">添加</a></span></li>
                        <li data-options="attributes:{url:'list.html'}"><span>列表</span></li>
                        <li><span>File 13</span></li>
                    </ul>
                </li>
                <li><span>File 2</span></li>
                <li><span>File 3</span></li>
            </ul>
        </li>
        <li><span>File21</span></li>
    </ul>
</div>
<div data-options="region:'center',title:'首页'">
    <%--静态初始化，直接加class--%>
    <div class="easyui-tabs" id="main-tabs">
        <div title="000000" closable="true">aaaaa</div>
    </div>
</div>
<script type="text/javascript">
        $(function () {
            $("#ul-tree").tree({
                url:"menu.html",
                onClick: function (node) {
                    if ($("#main-tabs").tabs('exists', node.text)) {//判断点击的页面是否存在
                        $("#main-tabs").tabs('select', node.text)//跳转到当前页面
                    }else {//不存在才加
                        $("#main-tabs").tabs('add',{
                            title: node.text,
                            closable: true,
                            href:node.attributes.url
                        })
                    }
                }
            })
        })

</script>
</body>
</html>
