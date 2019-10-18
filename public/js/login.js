$("#login").click(function () {


    $.ajax({
        type: "POST",
        url: "http://localhost/liteapi/auth/access",
        dataType: "json",
        success: function (response) {

            $.ajax({
                type: "POST",
                url: response.data.url,
                dataType: "json",
                success: function (response_user) {
                    console.debug(response_user);
                },
                headers: {
                    "Authorization": response.data.hash
                },
                data: {
                    "grant_type": response.data.grant_type,
                    "username": $("#usuario").val(),
                    "password": $("#senha").val()
                }
            });
        }
    });

   /* */

});