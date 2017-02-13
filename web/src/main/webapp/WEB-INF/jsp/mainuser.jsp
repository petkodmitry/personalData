<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Личный кабинет</title>
</head>
<body>
<H3>Добро пожаловать, ${user.getName()}!</H3><HR>

<form method="POST" action="user/editdata">
    <table>
        <tr>
            <td>Логин:</td>
            <td><input type="text" name="login" title="login" value="${user.getLogin()}"/></td>
        </tr>
        <tr>
            <td></td>
            <td><button type="button" formaction="user/changepassword">Сменить пароль</button> </td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td><input type="text" name="surname" title="surname"
                       value="${user.getSurname() != "(NULL)" ? user.getSurname() : ""}"/></td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td><input type="text" name="name" title="name"
                       value="${user.getName() != "(NULL)" ? user.getName() : ""}"/></td>
        </tr>
        <tr>
            <td>Отчество:</td>
            <td><input type="text" name="middlename" title="middlename"
                       value="${user.getMiddleName() != "(NULL)" ? user.getMiddleName() : ""}"/></td>
        </tr>
        <tr>
            <td>Дата рождения:</td>
            <td><input type="date" name="birthdate" title="birthdate"
                       value="${user.getBirthDate() != "(NULL)" ? user.getBirthDate() : ""}"/></td>
        </tr>
        <tr>
            <td>Город:</td>
            <td><input type="text" name="city" title="city"
                       value="${user.getContactData().getCity() != "(NULL)" ? user.getContactData().getCity() : ""}"/></td>
        </tr>
        <tr>
            <td>Улица:</td>
            <td><input type="text" name="street" title="street"
                       value="${user.getContactData().getStreet() != "(NULL)" ? user.getContactData().getStreet() : ""}"/></td>
        </tr>
        <tr>
            <td>Дом:</td>
            <td><input type="text" name="building" title="building"
                       value="${user.getContactData().getBuilding() != "(NULL)" ? user.getContactData().getBuilding() : ""}"/></td>
        </tr>
        <tr>
            <td>Квартира:</td>
            <td><input type="text" name="flat" title="flat"
                       value="${user.getContactData().getFlat() != "(NULL)" ? user.getContactData().getFlat() : ""}"/></td>
        </tr>
        <tr>
            <td>Телефон:</td>
            <td><input type="text" name="phone" title="phone"
                       value="${user.getContactData().getPhone() != "(NULL)" ? user.getContactData().getPhone() : ""}"/></td>
        </tr>
        <tr>
            <td>e-mail:</td>
            <td><input type="text" name="email" title="email"
                       value="${user.getContactData().getEmail() != "(NULL)" ? user.getContactData().getEmail() : ""}"/></td>
        </tr>
        <tr>
            <td>Тип пользователя:</td>
            <td><input disabled type="text" name="role" title="role" value="${user.getRole().toUpperCase()}"/></td>
        </tr>
        <tr>
            <td>Департамент:</td>
            <td><input disabled type="text" name="department" title="department"
                       value="${user.getDepartment() != "(NULL)" ? user.getDepartment() : ""}"/></td>
        </tr>
        <tr>
            <td>Должность:</td>
            <td><input disabled type="text" name="position" title="position"
                       value="${user.getPosition() != "(NULL)" ? user.getPosition() : ""}"/></td>
        </tr>
        <tr>
            <td>Стаж работы:</td>
            <td><input disabled type="text" name="experience" title="experience"
                       value="${user.getExperience() != "(NULL)" ? user.getExperience() : ""}"/></td>
        </tr>

        <tr></tr>
        <tr>
            <td></td>
            <td colspan="2" style="height: 50px;"><input type="submit" value="Редактировать" /></td>
        </tr>
    </table>
</form>

<BR><a href="user/logout">Выход</a><BR>
<c:if test="${requestScope['errorMessage'] != null}">
    <BR>Error: ${errorMessage}
</c:if>
</body>
</html>
