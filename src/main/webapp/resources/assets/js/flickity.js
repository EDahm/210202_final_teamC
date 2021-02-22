//
// flickity.js
//

'use strict';

(function() {

  // Flickity defaults

  Flickity.defaults.pageDots = false;
  Flickity.defaults.prevNextButtons = false;
  Flickity.defaults.imagesLoaded = true;
  Flickity.defaults.initialIndex = 0;
  Flickity.defaults.wrapAround = true;
  Flickity.defaults.cellAlign = 'left';

  // Toggle

  var $toggle = $('[data-toggle="flickity"]');

  $toggle.on('click', function() {
    var $this = $(this);
    var slide = $this.data('slide');
    var target = $this.data('target');
    var $target = $(target);

    $target.flickity('select', slide, true, true);
  });

})();

// iOS temporary fix fix

(function() {
  var touchingCarousel = false,
    touchStartCoords;

  document.body.addEventListener('touchstart', function(e) {
    if (e.target.closest('.flickity-slider')) {
      touchingCarousel = true;
    } else {
      touchingCarousel = false;
      return;
    }

    touchStartCoords = {
      x: e.touches[0].pageX,
      y: e.touches[0].pageY
    }
  });

  document.body.addEventListener('touchmove', function(e) {
    if (!(touchingCarousel && e.cancelable)) {
      return;
    }

    var moveVector = {
      x: e.touches[0].pageX - touchStartCoords.x,
      y: e.touches[0].pageY - touchStartCoords.y
    };

    if (Math.abs(moveVector.x) > 7)
      e.preventDefault()

  }, {
    passive: false
  });
})();
