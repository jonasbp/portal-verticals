let load = (function() {

    function VerticalsPart() {
        return function (src, target1, target2) {
            return new Promise(function (resolve, reject) {
                $(target1).load(src, function (response, status) {
                    if (status === 'success') {

                        if (target2 !== undefined)
                            $(target2).html(response);
                        resolve();

                    } else {
                        reject();
                    }
                });
            })
        }
    }

    return {
        Start: VerticalsPart()
    }
})();

// Carrega todas partes na mesma saída asincrona
Promise.all([
    load.Start('html/grids/navegation.html', '#navegation-bar', '#navegation-bar2'),
    load.Start('html/grids/copyright.html', '#bycraos', '#bycraos2'),
    load.Start('html/grids/menu.html', '#menu'),
    load.Start('html/feeds/artigo.html', '#postagens-artigos'),
    load.Start('html/grids/recents.html', '#recentes')
]).then(function() {

    $('.modal').modal();

    $("#ler-pagina").click = function(){
        $("#conteudo-pagina-lida").load("pagina-lida.html");
    };

    $("#login").click = function () {
        $.ajax({
            type: "POST",
            url: "/liteapi/auth/access",
            dataType: "json",
            success: loginuser,
            data: {
                service: "auth"
            }
        });
    };

    sessionStorage.user = JSON.stringify({
        nome: 'Oberdan',
        id_condominio: 1,
        nome_condominio: 'Craos',
        id_unidade: 2897,
        unidade: '11A',
        avatar: 'data:image/jpeg;base64,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'
    });

    if (sessionStorage.user !== undefined) {

        //Usuário logado
        let user = JSON.parse(sessionStorage.user);
        let avatar = document.getElementById('usuario_info');

        if (avatar !== null) {
            avatar.innerHTML = "<img alt='' href='trocarusuario' style='width: 25px; border-radius: 50px;' src='"+user.avatar+"' />";
        }
        document.getElementById('iconelogin').style.display = 'none';

    }

    console.debug('carregamento das partes efetuado com sucesso');


}).catch(function(reason) {
    console.error(reason);
});