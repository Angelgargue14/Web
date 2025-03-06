//document.getElementById('unlogin').addEventListener('click', function() {
//    document.getElementById('bloqueo').style.display = 'flex'; // Cambia el display a flex
//}); 

//document.getElementById('loguear').addEventListener('click', function() {
//    document.getElementById('bloqueo').style.display = 'none'; // Cambia el display a none
//  }); 

function addDigit(digit) {
    const passwordField = document.getElementById('password');
    if (passwordField.value.length < 4) {
        passwordField.value += digit;
    }
}

function clearPassword() {
    document.getElementById('password').value = '';
}   
