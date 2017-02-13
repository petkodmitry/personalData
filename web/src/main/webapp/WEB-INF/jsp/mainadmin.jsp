<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Администрирование</title>
</head>
<body>
<H3>Добро пожаловать, ${user.getLogin()}!</H3><HR>
<%--Вы вошли в систему как АДМИНИСТРАТОР<BR><BR>--%>
<%--<a href="login">На главную</a><BR>--%>
<a href="admin/allusers">Список пользователей</a><BR>
<a href="admin/register">Добавить пользователя</a><BR>
<BR><a href="admin/logout">Выход</a><BR>
<c:if test="${requestScope['errorMessage'] != null}">
    <BR>Error: ${errorMessage}
</c:if>
</body>
</html>
