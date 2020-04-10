var checkMatching = function(val1, val2){
    if(val1 == val2){
        return true
    } else {
        return false
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

    if(checkMatching(pass1, pass2)){
        $('#passMatch #match').hide();
    } else {
        $('#passMatch #match').show();
    }
}).focus(function(){
    $('#passMatch').show();
}).blur(function(){
    $('#passMatch').hide();
});

$('#mail1, #mail2').keyup(function(){
    var mail1 = $("#mail1").val();
    var mail2 = $("#mail2").val();

    if(checkMatching(mail1, mail2)){
        $('#alertMail #match').hide();
    } else {
        $('#alertMail #match').show();
    }
}).focus(function(){
    $('#alertMail').show();
}).blur(function(){
    $('#alertMail').hide();
});

$('#signup').click(function(){
    var name, surname, username, pass1, pass2, mail1, mail2;
    name = $('#name').val();
    surname = $('#surname').val();
    username = $('#username').val();
    pass1 = $('#pass1').val();
    pass2 = $('#pass2').val();
    mail1 = $('#mail1').val();
    mail2 = $('#mail2').val();

    if(name.length <= 0 || username.length <= 0 || pass1.length <= 0 || pass2.length <= 0 || mail1.length <= 0 || mail2.length <= 0){
        alert("Mandatory fields still empty");
    } else if(mail1 != mail2){
        alert("Emails don't match");
    } else if(pass1 != pass2){
        alert("Passwords don't match");
    } else {
        $('#signup_form').submit();
    }
});