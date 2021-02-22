//
// counter.js
//

'use strict';

(function() {

  var countdown = document.querySelectorAll('[data-countdown]');

  function count(countDownDate, el) {
    var now = new Date().getTime();
    var distance = countDownDate - now;

    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    days = days < 10 ? '0' + days : days;
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    hours = hours < 10 ? '0' + hours : hours;
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    seconds = seconds < 10 ? '0' + seconds : seconds;

    el.querySelector('[data-days]').innerHTML = days;
    el.querySelector('[data-hours]').innerHTML = hours;
    el.querySelector('[data-minutes]').innerHTML = minutes;
    el.querySelector('[data-seconds]').innerHTML = seconds;
  }

  function init(el) {
    var date = el.dataset.date;
    var countDownDate = new Date(date).getTime();

    count(countDownDate, el);
    setInterval(function() {
      count(countDownDate, el);
    }, 1000);
  }

  if (countdown.length) {
    [].forEach.call(countdown, function(el) {
      init(el);
    });
  }

})();
