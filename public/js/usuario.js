let loginuser = function (oauth) {

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
    apresentaavatar();

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

let apresentaavatar = function () {

    if (sessionStorage.user !== undefined) {

        //Usuário logado
        let user = JSON.parse(sessionStorage.user);
        let avatar = document.getElementById('usuario_info');

        if (avatar !== null) {
            avatar.innerHTML = "<img alt='' href='trocarusuario' style='width: 25px; border-radius: 50px;' src='"+user.avatar+"' />";
        }

        document.getElementById('iconelogin').style.display = 'none';
        document.getElementById('loginusuario').style.display = 'none';
        document.getElementById('botaologin').onclick = null;


    }


};