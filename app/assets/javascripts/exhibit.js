$(document).on('turbolinks:load', function () {
  $(function () {
    $("#price-input-field").on("keyup", function () {
      var price = $("#price-input-field").val();
      var fee = 0.1;
      // 手数料計 小数点切り下げ
      var resultfee = price * fee;
      var resultfee = Math.floor(resultfee);
      // 利益計算
      var resultprofit = price - resultfee;
      // カンマ区切り表示

      // var a = resultfee + "";
      // var b = resultfee.replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      // 実行条件　￥300〜9999999まで　その他の値はデフォルトのーを返す
      if (300 <= price && price <= 9999999) {
        $("#sale-fee-result").text("¥" + resultfee.toLocaleString());
        $("#sale-profit-result").text("¥" + resultprofit.toLocaleString());
      }
      else {
        $("#sale-fee-result").text("-");
        $("#sale-profit-result").text("-");
      }
    })
  })
});
