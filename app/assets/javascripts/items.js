$(document).on('turbolinks:load', function () {
  var myswiper = new Swiper('.swiper1', {
    centeredSlides: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    paginationClickable: true,
    simulateTouch: true,
    loop: true,
    speed: 1000,
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
    breakpoints: {
      // 980ピクセル幅以下になったら
      980: {
        slidesPerView: 3,
        spaceBetween: 30
      },
      // 640ピクセル幅以下になったら
      640: {
        slidesPerView: 2,
        spaceBetween: 20
      }
    },
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
    },
    navigation: {
      nextEl: '.swiper-button-next', // 次のスライドボタンのセレクタ
      prevEl: '.swiper-button-prev', // 前のスライドボタンのセレクタ
    },
  });

  $(function () {
    /*クリックイベント*/
    // $('.owl-dot').on('mouseover', function () {

    var myswiper2 = new Swiper('.swiper2', {
      spaceBetween: 10,
      slideToClickedSlide: true
    });

    var myswiper3 = new Swiper('.swiper3', {
      centeredSlides: true,
      paginationClickable: false,
      simulateTouch: true,
      slidesPerView: 4,
      speed: 500,
      breakpoints: {
        // 980ピクセル幅以下になったら
        980: {
          slidesPerView: 3,
          spaceBetween: 30
        },
        // 640ピクセル幅以下になったら
        640: {
          slidesPerView: 2,
          spaceBetween: 20
        }
      },
      controller: {
        control: myswiper2,
        inverse: false,
        by: 'slide',
      },
      spaceBetween: 10,
      slideToClickedSlide: true,
    })
    myswiper2.controller.control = myswiper3;
    // });
  });
});
