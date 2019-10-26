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

    document.getElementById('start-auth').onclick = function() {
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

    apresentaavatar();

    console.debug('carregamento das partes efetuado com sucesso');


}).catch(function(reason) {
    console.error(reason);
});