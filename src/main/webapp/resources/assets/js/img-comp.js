//
// img-comp.js
//

'use strict';

(function() {
  var input = document.querySelectorAll('.img-comp-input');

  function comp(el) {
    var front = el.parentElement.querySelector('.img-comp-front');
    var handle = el.parentElement.querySelector('.img-comp-handle');

    front.style.maxWidth = el.value + '%';
    handle.style.left = el.value + '%';
  }

  [].forEach.call(input, function(el) {
    'input change'.split(' ').forEach(function(event) {
      el.addEventListener(event, function() {
        comp(el);
      })
    });
  });

})();
