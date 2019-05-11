<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 77140
  Date: 2019/3/4
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="jquery-1.10.2.min.js"></script>
</head>
<body>
<form action="a.html" method="post" id="searchForm">
    <input type="hidden" name="page" id="pn">
    姓名:<input type="text" name="name" value="${param.name}">
    <input type="submit" value="提交" >
</form>
<table border="1" bgcolor="#faebd7">
<tr>
    <td>ID</td>
    <td>NAME</td>
    <td>SECRET_KEY</td>
    <td>NOTICE_KEY</td>
    <td>PASSWORD</td>
    <td>STATUS</td>
    <td>CREATED_DATE</td>
    <td>操作</td>
</tr>
    <C:forEach items="${requestScope.cpPageInfo.list}" var="l">
<tr>
    <td>${l.id}</td>
    <td>${l.name}</td>
    <td>${l.secretKey}</td>
    <td>${l.noticeKey}</td>
    <td>${l.password}</td>
    <td>${l.status}</td>
    <td><fmt:formatDate value="${l.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
    <td><a href="/go_update.html?id=${cp.id}">修改</a> </td>
</tr>
    </C:forEach>
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td align="right">
            <span>第${cpPageInfo.pageNum}/${cpPageInfo.pages}页</span>
            <span>
        	<a href="javascript:void(0)" onclick="chage(1)">[首页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="chage(${cpPageInfo.prePage})">[上一页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="chage(${cpPageInfo.pageNum+1})" >[下一页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="chage(${cpPageInfo.pages})">[尾页]</a>
        </span>
        </td>
    </tr>
</table>
<script type="text/javascript">
function chage(pageNum) {
//    alert(pageNum);
    $("#pn").val(pageNum);
    $("#searchForm").submit();
}
</script>
</body>
</html>
