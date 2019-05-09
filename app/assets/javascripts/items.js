window.addEventListener('DOMContentLoaded', function () {
  var mySwiper = new Swiper('.swiper-container', {
    centeredSlides: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    paginationClickable: true,
    simulateTouch: true,
    loop: true,
    speed: 1000,
    autoplay: {
      delay: 5000,
      disableOnInteraction: true,
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
}, false);
