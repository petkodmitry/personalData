function deleting($currentContextPath, $login) {
    if (confirm('Are you sure you want to delete the user with nickname <' + $login + '>?')) {
        window.location = $currentContextPath + '/admin/delete?login='+$login;
    }
}
