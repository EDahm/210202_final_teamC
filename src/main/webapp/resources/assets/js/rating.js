//
// rating.js
//

'use strict';

(function() {
  var $rating = $('.rating');
  var $ratingForm = $('.rating-form');
  var $ratingInput = $('.rating-input');

  $ratingInput.on('change input', function() {
    var $this = $(this);
    var $ratingCurrent = $this.closest($ratingForm).find($rating);
    var value = $this.val();

    $ratingCurrent.attr('data-value', value);
  });
})();
