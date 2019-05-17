$(document).on('turbolinks:load', function () {
  $(function () {
    $("#price-input-field").on("keyup", function () {
      var price = $("#price-input-field").val();

      var fee = 0.1;
      var resultfee = price * fee;
      var resultprofit = price - resultfee;

      price = parseInt(price);
      fee = parseInt(fee);
      resultfee = parseInt(resultfee);
      resultprofit = parseInt(resultprofit);

      $("#sale-fee-result").text(resultfee);
      $("#sale-profit-result").text(resultprofit);

      // console.log(price);


    })

  });
});
