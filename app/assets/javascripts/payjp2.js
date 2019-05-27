$(document).on('turbolinks:load', function() {
  var form = $("#charge-form2");
  Payjp.setPublicKey('pk_test_2226f8794a9cb7537df9cf45');

  $("#charge-form2").on("click", "#submit-button2", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: $("#number").val(),
        cvc: $("#security_code").val(),
        exp_month: $("#month").val(),
        exp_year: $("#year").val(),
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number2").removeAttr("name");
        $(".cvc2").removeAttr("name");
        $(".exp_month2").removeAttr("name");
        $(".exp_year2").removeAttr("name");
        var token = response.id;

        $("#charge-form2").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        $("#charge-form2").get(0).submit();
      }
    });
  });
});
