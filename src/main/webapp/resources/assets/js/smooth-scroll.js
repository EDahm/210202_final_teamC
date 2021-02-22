//
// smooth-scroll.js
//

'use strict';

(function() {

  var toggle = '[data-toggle="smooth-scroll"]';
  var offset = 0;

  function init(toggle) {
    var options = {
      header: '.navbar.fixed-top',
      offset: function(anchor, toggle) {
        return toggle.dataset.offset ? toggle.dataset.offset : offset
      }
    };

    new SmoothScroll(toggle, options);
  }

  if (typeof SmoothScroll !== 'undefined' && toggle) {
    init(toggle);
  }

})();
