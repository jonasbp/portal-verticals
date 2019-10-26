

let loginuser = function (oauth) {

    console.debug(document.getElementById('usuario'));

    $.ajax({
        type: "POST",
        url: oauth.data.oauth,
        dataType: "json",
        success: function (response) {
            userinfo(oauth)
        },
        headers: {
            "Authorization": oauth.data.hash
        },
        data: {
            "grant_type": oauth.data.grant_type,
            "username": $("#usuario").val(),
            "password": $("#senha").val()
        }
    });
};

let userinfo = function (oauth) {

    $.ajax({
        type: "GET",
        url: oauth.data.info + $("#usuario").val(),
        dataType: "json",
        success: function (response) {

            if (response.avatar === null) {
                obtemavatar(response, function (avatar) {
                    response.avatar = avatar;
                    salvarinfouser(response)
                })
            } else {
                salvarinfouser(response);
            }

        }
    });

};

let salvarinfouser = function(user) {
    sessionStorage.clear();
    sessionStorage.user = JSON.stringify(user);
    window.location = './';
};

let obtemavatar = function (userinfo, callback) {

    $.ajax({
        type: "POST",
        url: "/liteapi/auth/avatar",
        dataType: "json",
        success: function (response) {
            callback(response.data);
        },
        data: {
            service: "auth",
            username: userinfo.username,
            name: userinfo.first_name + ' ' + userinfo.last_name
        }
    });

};

$(document).ready(function () {

    if (sessionStorage.user !== undefined) {
        let user = JSON.parse(sessionStorage.user);
        //document.getElementById('user-cicle').src = user.avatar;
    }

});