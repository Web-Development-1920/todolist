var checkMatching = function(val1, val2){
    if(val1 == val2){
        return true
    } else {
        return false
    }
};

var validPass = function(pass){
    if(pass.match(/[a-z]/) && pass.match(/[A-Z]/) && pass.match(/[(,=.!@#$%^&*·¿¡+{}_|)]/) && pass.length >= 8){
        return true;
    } else {
        return false;
    }
};

var validEmail = function(email){
    if(email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
        return true;
    } else {
        return false;
    }
}

$('#pass1').keyup(function(){
    var pswd = $(this).val();
    
    // Check lower case
    if(pswd.match(/[a-z]/)){
        $('#letter').removeClass('invalid').addClass('valid');
    } else {
        $('#letter').removeClass('valid').addClass('invalid');
    }

    // Check upper case
    if(pswd.match(/[A-Z]/)){
        $('#capital').removeClass('invalid').addClass('valid');
    } else {
        $('#capital').removeClass('valid').addClass('invalid');
    }

    // Check special characters
    if(pswd.match(/[(,=.!@#$%^&*·¿¡+{}_|)]/)){
        $('#char').removeClass('invalid').addClass('valid');
    } else {
        $('#char').removeClass('valid').addClass('invalid');
    }

    // Check minimum length
    if(pswd.length < 8){
        $('#long').removeClass('valid').addClass('invalid');
    } else {
        $('#long').removeClass('invalid').addClass('valid');
    }
}).focus(function(){
    $('#alertPass').show();
}).blur(function(){
    $('#alertPass').hide();
});

$('#pass1, #pass2').keyup(function(){
    var pass1 = $("#pass1").val();
    var pass2 = $('#pass2').val();

    if(checkMatching(pass1, pass2) || (pass1.length <= 0)){
        $('#passMatch #match').hide();
    } else {
        $('#passMatch #match').show();
    }
}).focus(function(){
    $('#passMatch').show();
}).blur(function(){
    $('#passMatch').hide();
});

$('#signup').click(function(){
    var pass, mail;
    pass = $('#pass1').val();
    mail = $('#mail1').val();

    if(!validPass(pass) && (pass.length > 0)){
        alert("Password does not meet requirements");
    } else if(!validEmail(mail) && (mail.length > 0)){
        alert("Email is not valid");
    } else {
        $('#signup_form').submit();
    }
});