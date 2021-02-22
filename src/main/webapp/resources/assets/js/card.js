//
// variations.scss
//

'use strict';

(function() {

  var $toggle = $('[data-toggle="card-collapse"]');
  var $collapse = $('.card-collapse');

  $toggle.on({
    'mouseenter': function() {
      var $this = $(this);
      var $collapse = $this.find('.card-collapse');

      $collapse.collapse('show');
    },
    'mouseleave': function() {
      var $this = $(this);
      var $collapse = $this.find('.card-collapse');
      var isCollapsing = $collapse.hasClass('collapsing');

      if (isCollapsing) {
        setTimeout(function() {
          $collapse.collapse('hide');
        }, 350);
      } else {
        $collapse.collapse('hide');
      }
    }
  });

  $collapse.on({
    'show.bs.collapse': function() {
      var $this = $(this);
      var $parent = $this.closest('.card-collapse-parent');
      var collapseHeight = $this.outerHeight(true);

      $parent.css({
        '-webkit-transform': 'translateY(-' + collapseHeight + 'px)',
        'transform': 'translateY(-' + collapseHeight + 'px)'
      });
    },
    'hide.bs.collapse': function() {
      var $this = $(this);
      var $parent = $this.closest('.card-collapse-parent');

      $parent.css({
        '-webkit-transform': '',
        'transform': ''
      });
    }
  });

})();
