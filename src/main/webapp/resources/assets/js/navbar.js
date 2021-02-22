//
// navbar.js
//

'use strict';

(function() {
  var $navbarCollapse = $('.navbar-collapse');
  var $navbarDropdown = $('.navbar-nav .dropdown, .navbar-nav .dropright');

  $navbarDropdown.on('mouseenter mouseleave', function(e) {
    if (!$navbarCollapse.hasClass('show')) {
      var $this = $(this);
      var $toggle = $this.find('[data-toggle="dropdown"]');

      if (e.type === 'mouseenter') {
        $this.addClass('hovered');
        $toggle.dropdown('show');
      } else {
        $toggle.dropdown('hide');
        $toggle.blur();
      }
    }
  });
})();
