$("#login").click(function () {


    $.ajax({
        type: "POST",
        url: "/liteapi/auth/access",
        dataType: "json",
        success: function (response) {

            $.ajax({
                type: "POST",
                url: response.data.url,
                dataType: "json",
                success: function (response_user) {
                    if (response_user !== undefined) {
                        if (response_user.token_type === 'Bearer') {
                            sessionStorage.clear();
                            location = './';
                        }

                    }
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