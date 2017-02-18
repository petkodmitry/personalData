<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page errorPage="error.jsp" %>
<HTML>
<HEAD>
    <TITLE>All users</TITLE>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/deleteUser.js"></script>
</HEAD>
<BODY><H3>Table: Users</H3>
<HR>
<H4>Records found: ${totalToShow} from ${total}</H4>

<table border="1" frame="void">
    <tbody>
    <%--Sorting row of the table--%>
    <tr>
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
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=middleName&orderType=${"middleName".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Middle Name</a>
            <c:if test="${'asc'.equals(orderType) && 'middleName'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'middleName'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=surname&orderType=${"surname".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Surname</a>
            <c:if test="${'asc'.equals(orderType) && 'surname'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'surname'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=department&orderType=${"department".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Department</a>
            <c:if test="${'asc'.equals(orderType) && 'department'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'department'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=position&orderType=${"position".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Position</a>
            <c:if test="${'asc'.equals(orderType) && 'position'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'position'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=entryDate&orderType=${"entryDate".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Entry Date</a>
            <c:if test="${'asc'.equals(orderType) && 'entryDate'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'entryDate'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=city&orderType=${"city".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">City</a>
            <c:if test="${'asc'.equals(orderType) && 'city'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'city'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=street&orderType=${"street".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Street</a>
            <c:if test="${'asc'.equals(orderType) && 'street'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'street'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=building&orderType=${"building".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Building</a>
            <c:if test="${'asc'.equals(orderType) && 'building'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'building'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=flat&orderType=${"flat".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Flat</a>
            <c:if test="${'asc'.equals(orderType) && 'flat'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'flat'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=phone&orderType=${"phone".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">Phone</a>
            <c:if test="${'asc'.equals(orderType) && 'phone'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'phone'.equals(sortBy)}">↑</c:if>
        </td>
        <td><a href="${pageContext.request.contextPath}/admin/allusers?sortBy=email&orderType=${"email".equals(sortBy) ?
                    ("asc".equals(orderType) ? "desc" : "asc") : "asc"}">E-Mail</a>
            <c:if test="${'asc'.equals(orderType) && 'email'.equals(sortBy)}">↓</c:if>
            <c:if test="${'desc'.equals(orderType) && 'email'.equals(sortBy)}">↑</c:if>
        </td>
    </tr>
    <%--Filtering row of the table--%>
    <tr>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("login")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=login"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=login" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("name")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=name"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=name" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("middleName")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=middleName"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=middleName" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("surname")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=surname"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=surname" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("department")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=department"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=department" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("position")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=position"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=position" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 150px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 130px" type="date" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("entryDate")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=entryDate"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=entryDate" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("city")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=city"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=city" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("street")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=street"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=street" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("building")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=building"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=building" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("flat")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=flat"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=flat" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("phone")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=phone"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=phone" title="убрать фильтр">X</a>
            </form>
        </td>
        <td>
            <form style="height: 5px; min-width: 70px" method="POST" action="${pageContext.request.contextPath}/admin/allusers">
                <input style="width: 50px" type="text" title="для установки фильтра нажмите Enter" name="filterText"
                       value="${sessionScope.get("filters").get("email")}"/>
                <input type="submit"
                       formaction="${pageContext.request.contextPath}/admin/allusers?filterSet=email"
                       hidden="hidden"/>
                <a href="${pageContext.request.contextPath}/admin/allusers?filterRemove=email" title="убрать фильтр">X</a>
            </form>
        </td>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td><a href="${pageContext.request.contextPath}/admin/edit?username=${user.getLogin()}"
                title="Edit data for <${user.getLogin()}>">${user.getLogin()}</a></td>
            <td><c:out value="${user.getName()}"/></td>
            <td><c:out value="${user.getMiddleName()}"/></td>
            <td><c:out value="${user.getSurname()}"/></td>
            <td><c:out value="${user.getDepartment()}"/></td>
            <td><c:out value="${user.getPosition()}"/></td>
            <td><c:out value="${user.getEntryDate()}"/></td>
            <td><c:out value="${user.getContactData().getCity()}"/></td>
            <td><c:out value="${user.getContactData().getStreet()}"/></td>
            <td><c:out value="${user.getContactData().getBuilding()}"/></td>
            <td><c:out value="${user.getContactData().getFlat()}"/></td>
            <td><c:out value="${user.getContactData().getPhone()}"/></td>
            <td><c:out value="${user.getContactData().getEmail()}"/></td>
            <td style="border: 0px">
                <input type="button" value="Delete"
                       title="Delete <${user.getLogin()}>"
                       onclick="deleting('${pageContext.request.contextPath}', '${user.getLogin()}')" />
            </td>
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
