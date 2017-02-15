<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page errorPage="error.jsp" %>
<HTML>
<HEAD><TITLE>Личный кабинет</TITLE></HEAD>
<BODY><H3>Смена пароля:</H3>
<HR>

<form method="POST" action="${pageContext.request.contextPath}changepassword">
<%--<form method="POST" action="user/changepassword">--%>
    <table>
        <tr>
            <td>Current password:</td>
            <td><input type="password" name="current" title="current"/></td>
        </tr>
        <tr>
            <td>Repeat password:</td>
            <td><input type="password" name="repeat" title="repeat"/></td>
        </tr>
        <tr>
            <td>Enter a new password:</td>
            <td><input type="password" name="new" title="new"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="Cancel" onclick="location.href='${pageContext.request.contextPath}/user'" /></td>
            <td colspan="2"><input type="submit" value="Enter" /></td>
        </tr>
    </table>
</form>

<HR>
<c:if test="${requestScope['errorMessage'] != null}">
    Error: ${errorMessage}
</c:if>
</BODY>
</HTML>
