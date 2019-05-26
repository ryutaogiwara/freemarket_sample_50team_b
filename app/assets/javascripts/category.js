$(document).on('turbolinks:load', function () {

  //   カテゴリー一覧
  $('.header__contents__nav__left-category').hover(function () {
    $('.header__contents__nav__left-categories').toggle();
  });

  // $('.header__contents__nav__left-category').on('mouseleave', function () {
  //   $('.header__contents__nav__left-categories').toggle()
  // });

  $('.header__contents__nav__left-categories').on('mouseleave', function () {
    $(this).toggle()
  });

  $('.header__contents__nav__left-category').on('mouseleave', function () {
    $('.header__contents__nav__left-categories').toggle()
  });


  //   ブランド一覧
  $('.header__contents__nav__left-brand').hover(function () {
    $('.header__contents__nav__left-brands').toggle();
  });

  // $('.header__contents__nav__left-brand').on('mouseleave', function () {
  //   $('.header__contents__nav__left-brands').toggle()
  // });

  $('.header__contents__nav__left-brands').on('mouseleave', function () {
    $(this).toggle()
  });

  $('.header__contents__nav__left-brand').on('mouseleave', function () {
    $('.header__contents__nav__left-brands').toggle()
  });

});
