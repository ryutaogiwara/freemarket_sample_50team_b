$(document).on('turbolinks:load', function () {
  var modal = '.modal-wrapper'
  $(function () {
    $('.user-product__destroy').click(function () {
      $(modal).fadeIn();
    });

    $('.modal-wrapper').click(function () {
      $(modal).fadeOut();
    });

    $('.delete-modal__under__left').click(function () {
      $(modal).fadeOut();
    });

    $('.delete-modal__upper').click(function () {
      $(modal).fadeOut();
    });
  });
});
