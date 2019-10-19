$("#login").click(function () {

    $.ajax({
        type: "POST",
        url: "/liteapi/auth/access",
        dataType: "json",
        success: loginuser
    });

});

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

            }

            sessionStorage.clear();
            sessionStorage.user = JSON.stringify(response);
            window.location = './';
        }
    });

};

let obtemavatar = function () {

};