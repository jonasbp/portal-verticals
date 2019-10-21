//user register
//$(document).ready(function () {
    //$('.modal').modal();
//});

//  Barra de navegação topo - Usuário deslogado

$.post('./html/grids/navegation.html', function (navegation) {

    $('#navegation-bar').html(navegation);
    $('#navegation-bar2').html(navegation);

    if (sessionStorage.user !== undefined) {
        let user = JSON.parse(sessionStorage.user);
        let avatar = document.getElementById('usuario_info');

        if (avatar !== null)
            avatar.innerHTML = "<img alt='' style='width: 25px' src='"+user.avatar+"' />";
    }
});


//  Selo copyright - Coluna lateral
$.post('./html/grids/copyright.html', function (copyright) {
    $('#bycraos').html(copyright);
    $('#bycraos2').html(copyright);
});

//  Menu Lateral - Acessos
$.post('./html/grids/menu.html', function (menu) {
    $('#menu').html(menu);
});

$.post('./html/feeds/artigo.html', function (artigo) {
    $('#postagens-artigos').html(artigo);
});

$.post('./html/grids/recents.html', function (recents) {
    $('#recentes').html(recents);
});

$(document).ready(function(){
    $("#ler-pagina").click(function(){

        $(function(){
            $("#conteudo-pagina-lida").load("pagina-lida.html");
        });
    })
});

//
// function exibirregistro() {
//     // document.getElementById("registro").innerHTML = './html/register.html';
//     window.location.replace('./html/register.html','janela');
// }
//
// $.post('../html/register.html', function (registro) {
//     $('register').html(registro);
// });
