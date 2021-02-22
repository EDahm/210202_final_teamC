//
// simplebar.js
//

'use strict';

(function() {

  var $toggle = $('.collapse[data-toggle="simplebar"]');

  $toggle.on({
    'shown.bs.collapse': function() {
      var $this = $(this);
      var $target = $($this.data('target'));

      if (typeof SimpleBar !== 'undefined') {
        new SimpleBar($target.get(0));
      }
    },
    'hidden.bs.collapse': function() {
      var $this = $(this);
      var $target = $($this.data('target'));

      if (typeof SimpleBar !== 'undefined') {
        SimpleBar.instances.get($target.get(0)).unMount();
      }
    }
  });

})();
