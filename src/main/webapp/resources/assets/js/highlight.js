//
// highlight.js
//

'use strict';

(function() {
  var toggle = document.querySelectorAll('.highlight');

  if (typeof hljs !== 'undefined' && toggle) {
    [].forEach.call(toggle, function(el) {
      hljs.highlightBlock(el);
    });
  }
})();
