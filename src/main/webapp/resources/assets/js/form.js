//
// form.js
//

'use strict';

(function() {
  var toggle = document.querySelectorAll('[data-toggle="form-caption"]');

  [].forEach.call(toggle, function(el) {
    el.addEventListener('change', function() {
      var target = document.querySelector(el.dataset.target);
      var value = el.value;

      target.innerHTML = value;
    });
  });
})();
