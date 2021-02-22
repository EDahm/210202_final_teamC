//
// list.js
//

'use strict';

(function() {
  var $toggle = $('[data-toggle="lists"]');

  $toggle.each(function() {
    var $this = $(this);
    var options = $this.data('options');

    if (typeof List !== 'undefined') {
      new List($this.get(0), options);
    }
  });

})();
