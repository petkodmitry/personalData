<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <script>
        var counter = 0;
        $(document).on('change', '.checkable', function () {
            var $current = $(this).val();
//            var $current = $(this).closest('div').find('input[name="current"]').val();
            var $default = $(this).siblings('input[title="default"]').val();
            if ($current == $default) counter = counter - 1;
            else counter = counter + 1;
            if (counter != 0) {
                $('#edit').prop('disabled', false);
                $('#cancel').prop('disabled', false);
            }
            else {
                $('#edit').prop('disabled', true);
                $('#cancel').prop('disabled', true);
            }
        });

        function cancelAll() {
            $(".checkable").each(
                    function() {
                        $(this).val($(this).siblings('input[title="default"]').val());
                    }
            );
            $('#edit').prop('disabled', true);
            $('#cancel').prop('disabled', true);
        }
    </script>

    <title>Личный кабинет</title>
</head>
<body>
<H3>Добро пожаловать, ${user.getName()}!</H3>
<HR>

<%--<form method="POST" action="user/editdata">--%>
<form method="POST" action="user">
    <table>
        <tr>
            <td>Логин:</td>
            <td><input disabled type="text" name="login" title="login" value="${user.getLogin()}"/></td>
        </tr>
        <tr>
            <td></td>
            <%--<td><button type="button" onclick="location.href='user/changepassword'">Сменить пароль</button> </td>--%>
            <td>
                <button type="button" onclick="checkChanges('qwe')">Сменить пароль</button>
            </td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td>
                <div>
                    <input type="text" name="surname" class="checkable" title="surname"
                           value="${user.getSurname() != "(NULL)" ? user.getSurname() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getSurname() != "(NULL)" ? user.getSurname() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td>
                <div>
                    <input type="text" name="name" class="checkable" title="name"
                           value="${user.getName() != "(NULL)" ? user.getName() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getName() != "(NULL)" ? user.getName() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Отчество:</td>
            <td>
                <div>
                    <input type="text" name="middlename" class="checkable" title="middlename"
                           value="${user.getMiddleName() != "(NULL)" ? user.getMiddleName() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getMiddleName() != "(NULL)" ? user.getMiddleName() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Дата рождения:</td>
            <td>
                <div>
                    <input type="date" name="birthdate" class="checkable" title="birthdate"
                           <%--value="${user.getBirthDate() != "(NULL)" ? (user.getBirthDate().getYear().toString().concat("-").concat(user.getBirthDate().getMonth()).concat("-").concat(user.getBirthDate().getDate())) : ""}"/>--%>
                           value="${user.getBirthDate() != "(NULL)" ? String.format("%d-%s%d-%s%d", user.getBirthDate().getYear() + 1900, user.getBirthDate().getMonth() >= 9 ? "" : "0", user.getBirthDate().getMonth() + 1, user.getBirthDate().getDate() >= 10 ? "" : "0", user.getBirthDate().getDate()) : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getBirthDate() != "(NULL)" ? String.format("%d-%s%d-%s%d", user.getBirthDate().getYear() + 1900, user.getBirthDate().getMonth() >= 9 ? "" : "0", user.getBirthDate().getMonth() + 1, user.getBirthDate().getDate() >= 10 ? "" : "0", user.getBirthDate().getDate()) : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Город:</td>
            <td>
                <div>
                    <input type="text" name="city" class="checkable" title="city"
                           value="${user.getContactData().getCity() != "(NULL)" ? user.getContactData().getCity() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getContactData().getCity() != "(NULL)" ? user.getContactData().getCity() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Улица:</td>
            <td>
                <div>
                    <input type="text" name="street" class="checkable" title="street"
                           value="${user.getContactData().getStreet() != "(NULL)" ? user.getContactData().getStreet() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getContactData().getStreet() != "(NULL)" ? user.getContactData().getStreet() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Дом:</td>
            <td>
                <div>
                    <input type="text" name="building" class="checkable" title="building"
                           value="${user.getContactData().getBuilding() != "(NULL)" ? user.getContactData().getBuilding() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getContactData().getBuilding() != "(NULL)" ? user.getContactData().getBuilding() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Квартира:</td>
            <td>
                <div>
                    <input type="text" name="flat" class="checkable" title="flat"
                           value="${user.getContactData().getFlat() != "(NULL)" ? user.getContactData().getFlat() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getContactData().getFlat() != "(NULL)" ? user.getContactData().getFlat() : ""}"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>Телефон:</td>
            <td>
                <div>
                    <input type="text" name="phone" class="checkable" title="phone"
                           value="${user.getContactData().getPhone() != "(NULL)" ? user.getContactData().getPhone() : ""}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getContactData().getPhone() != "(NULL)" ? user.getContactData().getPhone() : ""}"/>
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
                           value="${user.getContactData().getEmail() != '(NULL)' ? user.getContactData().getEmail() : ''}"/>
                    <input hidden="hidden" title="default"
                           value="${user.getContactData().getEmail() != '(NULL)' ? user.getContactData().getEmail() : ''}"/>
                </div>
            </td>
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
            <td><input id="cancel" disabled type="button" value="Отменить" onclick="cancelAll()"/></td>
            <td colspan="2" style="height: 50px;"><input id="edit" disabled type="submit" value="Редактировать"/></td>
        </tr>
    </table>
</form>

<BR><a href="user/logout">Выход</a><BR>
<c:if test="${requestScope['errorMessage'] != null}">
    <BR>Error: ${errorMessage}
</c:if>
</body>
</html>
