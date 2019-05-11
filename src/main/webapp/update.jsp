<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/update.html" id="edit-form" class="easyui-form">
    <input type="hidden" name="id" value="${cp.id}" />

    公司名称:<input type="text" name="name" value="${cp.name}" /><br>
    保密锁🔒:<input type="text" name="secretKey" value="${cp.secretKey}" /><br>
    通知索🔒:<input type="text" name="noticeKey" value="${cp.secretKey}" /><br>
    密码🔒:<input type="text" name="password" value="${cp.password}" /><br>
    状态:<input type="text" name="status"value="${cp.status}" /><br>
    创建时间:<input name="createdDate" value="<fmt:formatDate value='${cp.createdDate}' pattern='yyyy-MM-dd'/>" />

    <%--<input type="submit" value="提交">--%>
</form>
${message}
</body>
</html>
