var counter = 0;
var isEmailOk = true;
var isPhoneOk = true;

$(document).on('change', '.checkable', function () {
    var $current = $(this).val();
    var $default = $(this).siblings('input[title="default"]').val();
    if ($current == $default) counter = counter - 1;
    else counter = counter + 1;

    if ($(this).attr('name') == 'email') {
        var regexEmail = /^[a-zA-Z0-9.%+-_]+@[a-zA-Z0-9.%+-]+\.[a-zA-Z]{2,}$/;
        isEmailOk = !!regexEmail.test($current);
    }
    if ($(this).attr('name') == 'phone') {
        var regexPhone = /^\+375\([0-9]{2}\)[0-9]{3}\-[0-9]{2}\-[0-9]{2}$/;
        isPhoneOk = !!regexPhone.test($current);
    }

    if (counter != 0) {
        $('#edit').prop('disabled', false);
        $('#cancel').prop('disabled', false);
        $('#emailError').text('');
        $('#phoneError').text('');
        if (!isEmailOk) {
            $('#edit').prop('disabled', true);
            $('#emailError').text('wrong email format!');
        }
        if (!isPhoneOk) {
            $('#edit').prop('disabled', true);
            $('#phoneError').text('phone number must be "+375(xx)xxx-xx-xx" formatted.');
        }
    }
    else {
        $('#edit').prop('disabled', true);
        $('#cancel').prop('disabled', true);
    }
});

function cancelAll() {
    $(".checkable").each(
        function () {
            $(this).val($(this).siblings('input[title="default"]').val());
        }
    );
    $('#emailError').text('');
    isEmailOk = true;
    $('#phoneError').text('');
    isPhoneOk = true;
    $('#edit').prop('disabled', true);
    $('#cancel').prop('disabled', true);
}
