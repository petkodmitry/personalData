function deleting($login) {
    if (confirm('Are you sure you want to delete the user with nickname <' + $login + '>?')) {
        window.location = '/admin/delete?login='+$login;
    }
}
