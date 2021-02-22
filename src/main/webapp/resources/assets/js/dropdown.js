//
// dropdown.scss
//

'use strict';

(function() {
  var $dropright = $('.dropright');
  var $dropdownMenu = $('.dropdown-menu');
  var $collapseToggle = $('[data-toggle="collapse"]');

  var $navbarCollapse = $('.navbar-collapse');
  var $navbarDropdown = $('.navbar .dropdown');
  var $navbarSmoothToggle = $('.navbar .nav-link[data-toggle="smooth-scroll"]');
  var $navbarDroprightToggle = $('.navbar .dropdown-menu .dropright [data-toggle="dropdown"]');

  $navbarDroprightToggle.on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();

    var $this = $(this);
    var $currentMenu = $this.closest($dropright).find($dropdownMenu);
    var $siblingMenus = $this.closest($dropdownMenu).find($dropdownMenu).not($currentMenu);

    $currentMenu.toggleClass('show');
    $siblingMenus.removeClass('show');
  });

  $navbarDropdown.on('hide.bs.dropdown', function() {
    var $this = $(this);
    var $droprightMenus = $this.find($dropright).find($dropdownMenu);
    var $collapseToggles = $this.find($collapseToggle);

    $droprightMenus.removeClass('show');

    $collapseToggles.each(function() {
      var $this = $(this);
      var $collapse = $($this.attr('href')) || $($this.data('target'));

      $collapse.collapse('hide');
    });
  });

  $navbarSmoothToggle.on('click', function(e) {
    var $this = $(this);
    var $collapse = $this.closest($navbarCollapse);

    $collapse.collapse('hide');
  });

})();
