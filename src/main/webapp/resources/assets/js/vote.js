//
// vote.js
//

'use strict';

(function() {
  var $toggle = $('[data-toggle="vote"]');

  $toggle.on('click', function(e) {
    e.preventDefault();

    var $this = $(this);
    var count = $this.attr('data-count');

    $this.attr('data-count', ++count);
  });
})();
