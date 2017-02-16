<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <script type="text/javascript" src="../../js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../../js/editUser.js"></script>

    <title>Edit User data</title>
</head>
<body>
<HR>

<form method="POST" action="${pageContext.request.contextPath}/admin/edit">
    <table>
        <tr>
            <td>Логин:</td>
            <td><input disabled type="text" name="login" title="login" value="${userEntity.getLogin()}"/></td>
        </tr>
        <tr>
            <td>Пароль:</td>
            <td>
                <div>
                    <input type="text" name="password" class="checkable" title="password"
                           value="${userEntity.getPassword() != "(NULL)" ? userEntity.getPassword() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getPassword() != "(NULL)" ? userEntity.getPassword() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td>
                <div>
                    <input type="text" name="surname" class="checkable" title="surname"
                           value="${userEntity.getSurname() != "(NULL)" ? userEntity.getSurname() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getSurname() != "(NULL)" ? userEntity.getSurname() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td>
                <div>
                    <input type="text" name="name" class="checkable" title="name"
                           value="${userEntity.getName() != "(NULL)" ? userEntity.getName() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getName() != "(NULL)" ? userEntity.getName() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Отчество:</td>
            <td>
                <div>
                    <input type="text" name="middlename" class="checkable" title="middlename"
                           value="${userEntity.getMiddleName() != "(NULL)" ? userEntity.getMiddleName() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getMiddleName() != "(NULL)" ? userEntity.getMiddleName() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Дата рождения:</td>
            <td>
                <div>
                    <input type="date" name="birthdate" class="checkable" title="birthdate"
                           value="${userEntity.getBirthDate() != "(NULL)" ? String.format("%d-%s%d-%s%d", userEntity.getBirthDate().getYear() + 1900, userEntity.getBirthDate().getMonth() >= 9 ? "" : "0", userEntity.getBirthDate().getMonth() + 1, userEntity.getBirthDate().getDate() >= 10 ? "" : "0", userEntity.getBirthDate().getDate()) : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getBirthDate() != "(NULL)" ? String.format("%d-%s%d-%s%d", userEntity.getBirthDate().getYear() + 1900, userEntity.getBirthDate().getMonth() >= 9 ? "" : "0", userEntity.getBirthDate().getMonth() + 1, userEntity.getBirthDate().getDate() >= 10 ? "" : "0", userEntity.getBirthDate().getDate()) : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Город:</td>
            <td>
                <div>
                    <input type="text" name="city" class="checkable" title="city"
                           value="${userEntity.getContactData().getCity() != "(NULL)" ? userEntity.getContactData().getCity() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getContactData().getCity() != "(NULL)" ? userEntity.getContactData().getCity() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Улица:</td>
            <td>
                <div>
                    <input type="text" name="street" class="checkable" title="street"
                           value="${userEntity.getContactData().getStreet() != "(NULL)" ? userEntity.getContactData().getStreet() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getContactData().getStreet() != "(NULL)" ? userEntity.getContactData().getStreet() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Дом:</td>
            <td>
                <div>
                    <input type="text" name="building" class="checkable" title="building"
                           value="${userEntity.getContactData().getBuilding() != "(NULL)" ? userEntity.getContactData().getBuilding() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getContactData().getBuilding() != "(NULL)" ? userEntity.getContactData().getBuilding() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Квартира:</td>
            <td>
                <div>
                    <input type="text" name="flat" class="checkable" title="flat"
                           value="${userEntity.getContactData().getFlat() != "(NULL)" ? userEntity.getContactData().getFlat() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getContactData().getFlat() != "(NULL)" ? userEntity.getContactData().getFlat() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Телефон:</td>
            <td>
                <div>
                    <input type="text" name="phone" class="checkable" title="phone"
                           value="${userEntity.getContactData().getPhone() != "(NULL)" ? userEntity.getContactData().getPhone() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getContactData().getPhone() != "(NULL)" ? userEntity.getContactData().getPhone() : ""}"/>
                    <label id="phoneError" style="color: RED"></label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                e-mail:
            </td>
            <td>
                <div>
                    <input type="text" name="email" class="checkable" title="email"
                           value="${userEntity.getContactData().getEmail() != '(NULL)' ? userEntity.getContactData().getEmail() : ''}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getContactData().getEmail() != '(NULL)' ? userEntity.getContactData().getEmail() : ''}"/>
                    <label id="emailError" style="color: RED"></label>
                </div>
            </td>
        </tr>
        <tr>
            <td>Тип пользователя:</td>
            <td>
                <div>
                    <select name="role" class="checkable" title="role">
                        <c:forEach items="${roleTypes}" var="roleType">
                            <c:set var="role" value="${roleType.toString()}"/>
                            <option value="${role}"
                                ${role.equals(userEntity.getRole().toUpperCase()) ? 'selected="selected"' : ''}>${role}
                            </option>
                        </c:forEach>
                    </select>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getRole().toUpperCase()}"/>
                </div>
            </td>
            <%--<td>
                <div>
                    <select name="role" class="checkable" title="role">
                        <option value="ADMIN"
                        ${'ADMIN'.equals(userEntity.getRole().toUpperCase()) ? 'selected="selected"' : ''}>ADMIN
                        </option>
                        <option value="USER"
                        ${'USER'.equals(userEntity.getRole().toUpperCase()) ? 'selected="selected"' : ''}>USER
                        </option>
                        &lt;%&ndash;<option value="5" ${max == 5 ? 'selected="selected"' : ''}>5</option>&ndash;%&gt;
                    </select>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getRole().toUpperCase()}"/>
                </div>
            </td>--%>
            <%--<td>
                <div>
                    <input type="text" name="role" class="checkable" title="role"
                           value="${userEntity.getRole().toUpperCase()}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getRole().toUpperCase()}"/>
                </div>
            </td>--%>
        </tr>
        <tr>
            <td>Департамент:</td>
            <td>
                <div>
                    <input type="text" name="department" class="checkable" title="department"
                           value="${userEntity.getDepartment() != "(NULL)" ? userEntity.getDepartment() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getDepartment() != "(NULL)" ? userEntity.getDepartment() : ""}"/>
                </div>
            </td>


        </tr>
        <tr>
            <td>Должность:</td>
            <td>
                <div>
                    <input type="text" name="position" class="checkable" title="position"
                           value="${userEntity.getPosition() != "(NULL)" ? userEntity.getPosition() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${userEntity.getPosition() != "(NULL)" ? userEntity.getPosition() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Дата приёма:</td>
            <td>
                <div>
                    <input type="date" name="entrydate" class="checkable" title="entrydate"
                           value="${String.format("%d-%s%d-%s%d", userEntity.getEntryDate().getYear() + 1900, userEntity.getEntryDate().getMonth() >= 9 ? "" : "0", userEntity.getEntryDate().getMonth() + 1, userEntity.getEntryDate().getDate() >= 10 ? "" : "0", userEntity.getEntryDate().getDate())}"/>
                    <input hidden="hidden" title="default"
                           value="${String.format("%d-%s%d-%s%d", userEntity.getEntryDate().getYear() + 1900, userEntity.getEntryDate().getMonth() >= 9 ? "" : "0", userEntity.getEntryDate().getMonth() + 1, userEntity.getEntryDate().getDate() >= 10 ? "" : "0", userEntity.getEntryDate().getDate())}"/>
                </div>
            </td>
        </tr>

        <tr></tr>
        <tr>
            <td style="height: 30px; vertical-align: bottom"><input id="cancel" disabled type="button" value="Отменить"
                                                                    onclick="cancelAll()"/></td>
            <td style="height: 30px; vertical-align: bottom"><input id="edit" disabled type="submit"
                                                                    value="Редактировать"/></td>
        </tr>
    </table>
</form>

<BR><a href="${pageContext.request.contextPath}/admin/allusers">Назад</a><BR>
<c:if test="${requestScope['errorMessage'] != null}">
    <BR>Error: ${errorMessage}
</c:if>
</body>
</html>
