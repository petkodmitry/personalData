<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Администрирование</title>
</head>
<body>
<H3>Добро пожаловать, ${user.getLogin()}!</H3><HR>
<a href="${pageContext.request.contextPath}/admin/allusers">Список пользователей</a><BR>
<BR><a href="${pageContext.request.contextPath}/admin/register">Добавить пользователя</a><BR>
<BR><BR><a href="${pageContext.request.contextPath}/admin/logout">Выход</a><BR>
<c:if test="${requestScope['errorMessage'] != null}">
    <BR>Error: ${errorMessage}
</c:if>
</body>
</html>
