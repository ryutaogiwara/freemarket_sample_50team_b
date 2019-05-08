$(function() {
      /*クリックイベント*/
      $('#tab2').on('click', function() {
        $('#tab1').removeClass("is-active-item");
        $('#notice2').removeClass("nonactive");
        $('#tab2').addClass("is-active-item");
        $('#notice1').addClass("nonactive");
      });
      $('#tab1').on('click', function() {
        $('#tab2').removeClass("is-active-item");
        $('#notice1').removeClass("nonactive");
        $('#tab1').addClass("is-active-item");
        $('#notice2').addClass("nonactive");
      });
      $('#tab4').on('click', function() {
        $('#tab3').removeClass("is-active-item");
        $('#notice4').removeClass("nonactive");
        $('#tab4').addClass("is-active-item");
        $('#notice3').addClass("nonactive");
      });
      $('#tab3').on('click', function() {
        $('#tab4').removeClass("is-active-item");
        $('#notice3').removeClass("nonactive");
        $('#tab3').addClass("is-active-item");
        $('#notice4').addClass("nonactive");
      });
    });
