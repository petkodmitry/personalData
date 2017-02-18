<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.locale}" />
<fmt:setBundle basename="i18n.messages" />

<%@ page errorPage="error.jsp" %>
<HTML>
<HEAD><TITLE><fmt:message key="page.login.title" /></TITLE></HEAD>
<BODY><H3><fmt:message key="page.login.body.head"/></H3>
<div style="float: left">
    <a tabindex="-1" href="${pageContext.request.contextPath}/login?locale=ru" style="padding: 5px">RU</a>
    <a tabindex="-1" href="${pageContext.request.contextPath}/login?locale=en" style="padding: 5px">EN</a>
</div><BR>
<HR>

<form method="POST" action="login?locale=${param.locale}" >
    <table>
        <tr>
            <td><fmt:message key="page.login.login"/></td>
            <td><input type="text" name="username" title="username"/></td>
        </tr>
        <tr>
            <td><fmt:message key="page.login.password"/></td>
            <td><input type="password" name="password" title="password"/></td>
        </tr>
        <tr>
            <td><input type="reset" value="<fmt:message key="page.login.reset"/>" /></td>
            <td><input type="submit" value="<fmt:message key="page.login.enter"/>" style="float: right" /></td>
        </tr>
    </table>
</form>

<HR>
<c:if test="${requestScope['errorMessage'] != null}">
    <fmt:message key="message.error"/> ${errorMessage}
</c:if>
</BODY>
</HTML>
