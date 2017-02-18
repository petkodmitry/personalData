var counter = 0;
var regexEmail = /^[a-zA-Z0-9.%+-_]+@[a-zA-Z0-9.%+-]+\.[a-zA-Z]{2,}$/;
var regexPhone = /^\+375\([0-9]{2}\)[0-9]{3}\-[0-9]{2}\-[0-9]{2}$/;

$(document).on('change', '.checkable', function () {
    var $current = $(this).val();
    var $default = $(this).siblings('input[title="default"]').val();
    if ($current == $default) counter = counter - 1;
    else counter = counter + 1;

    $('#loginError').text('');
    $('#passwordError').text('');
    $('#emailError').text('');
    $('#phoneError').text('');

    if (counter != 0) {
        $('#edit').prop('disabled', false);
        $('#cancel').prop('disabled', false);
        validateAll();
    }
    else {
        $('#edit').prop('disabled', true);
        $('#cancel').prop('disabled', true);
    }
});

function validateAll() {
    var loginValue = $('.checkable[name="login"]').val();
    if (loginValue != null && loginValue.length < 3) {
        $('#edit').prop('disabled', true);
        $('#loginError').text('Login length must be at list 3 characters.');
    }
    var passwordValue = $('.checkable[name="password"]').val();
    if (passwordValue != null && passwordValue.length < 6) {
        $('#edit').prop('disabled', true);
        $('#passwordError').text('Password length must be at list 6 characters.');
    }
    var emailValue = $('.checkable[name="email"]').val();
    if (emailValue != null && !regexEmail.test(emailValue) && emailValue.length > 0) {
        $('#edit').prop('disabled', true);
        $('#emailError').text('Wrong email format!');
    }
    var phoneValue = $('.checkable[name="phone"]').val();
    if (phoneValue != null && !regexPhone.test(phoneValue) && phoneValue.length > 0) {
        $('#edit').prop('disabled', true);
        $('#phoneError').text('Phone number must be "+375(xx)xxx-xx-xx" formatted.');
    }
}

function cancelAll() {
    $(".checkable").each(
        function () {
            $(this).val($(this).siblings('input[title="default"]').val());
        }
    );
    $('#loginError').text('');
    $('#passwordError').text('');
    $('#emailError').text('');
    $('#phoneError').text('');
    $('#edit').prop('disabled', true);
    $('#cancel').prop('disabled', true);
}
