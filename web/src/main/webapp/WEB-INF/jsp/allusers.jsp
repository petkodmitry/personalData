<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page errorPage="error.jsp" %>
<HTML>
<HEAD><TITLE>All users</TITLE></HEAD>
<BODY><H3>Table: Users</H3>
<HR>
<H4>Records found: ${totalToShow} from ${total}</H4>

<%--<c:choose>
    <c:when test="${requestScope.get('page') == null}">
        <c:set var="page" value="1"/>
        ${requestScope.putIfAbsent("page", "1")}
    </c:when>
    <c:otherwise>
        <c:set var="page" value="${requestScope.get('page')}"/>
    </c:otherwise>
</c:choose>--%>

<table border="1" frame="void">
    <tbody>
    <%--Sorting row of the table--%>
    <tr>
        <%--<td><a href="controller?cmd=showUsers&page=1&sortBy=userId&orderType=${"userId".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">ID</a>
            <c:if test="${'asc'.equals(orderType) && 'userId'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'userId'.equals(sortBy)}">↑</c:if>
        </td>--%>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=login&orderType=${"login".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Login</a>
            <c:if test="${'asc'.equals(orderType) && 'login'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'login'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=name&orderType=${"name".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Name</a>
            <c:if test="${'asc'.equals(orderType) && 'name'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'name'.equals(sortBy)}">↑</c:if>
        </td>
    </tr>
    <%--Filtering row of the table--%>
    <tr>
        <%--<td>
            <form style="height: 5px" method="POST" action="controller">
                <input style="width: 50px" type="text" title="установить фильтр" name="isAdminFilter"
                       value="${sessionScope.get("filters").get("isAdmin")}"/>
                <input type="submit" formaction="controller?cmd=showUsers&page=1" hidden="hidden"/>
                <a href="controller?cmd=showUsers&page=${sessionScope.get("filters").get("isAdmin") == null ? page : 1}&filterRemove=isAdmin">X</a>
            </form>
        </td>--%>
        <td>
            <form style="height: 5px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="установить фильтр" name="filterText"
                       value="${sessionScope.get("filters").get("login")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=login"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=login">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="установить фильтр" name="filterText"
                       value="${sessionScope.get("filters").get("name")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=name"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=name">X</a>
            </form>
        </td>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td><c:out value="${user.getLogin()}"/></td>
            <td><c:out value="${user.getName()}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<BR>

<HR>
<BR><a href="${pageContext.request.contextPath}/admin">На главную</a><BR>
<BR><BR><a href="${pageContext.request.contextPath}/admin/logout">Выход</a><BR>
<c:if test="${requestScope['errorMessage'] != null}">
    <BR>Error: ${errorMessage}
</c:if>
</BODY>
</HTML>
