//
// collapse.js
//

'use strict';

(function() {
  var $toggle = $('[data-toggle="collapse"][data-action]');

  $toggle.on('click', function(e) {
    e.stopPropagation();

    var $this = $(this);
    var action = $this.data('action');
    var target = $this.data('target');
    var $target = $(target);

    $target.collapse(action);
  });
})();
