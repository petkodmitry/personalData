<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ErrorPage</title>
</head>
<body>
<H3>Ошибка!</H3><hr><br>
${errorMessage}<br><br>
<a href="${pageContext.request.contextPath}/login">На главную</a>
<br><br><a href="${pageContext.request.contextPath}/user/logout">Выход</a>
</body>
</html>
