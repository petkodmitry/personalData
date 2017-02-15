<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page errorPage="error.jsp" %>
<HTML>
<HEAD><TITLE>Users of the Company</TITLE></HEAD>
<BODY><H3>Войдите в систему:</H3>
<HR>

<form method="POST" action="login" >
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="username" title="username"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" title="password"/></td>
        </tr>
        <tr>
            <td><input type="reset" value="Reset" /></td>
            <td><input type="submit" value="Enter" style="float: right" /></td>
        </tr>
    </table>
</form>

<HR>
<c:if test="${requestScope['errorMessage'] != null}">
    Error: ${errorMessage}
</c:if>
</BODY>
</HTML>
