
var DynamicTime = {
  loop: function() {
    var dateDivs = document.querySelectorAll('*[data-date]');
    for (var div of dateDivs) {
      var rawdate = div.dataset.date;
      var date = new Date(rawdate);
      var s = ((new Date()) - date) / 1000;
      var str;
      if (s < 60) {
        str = Math.round(s) + "s";
      } else if (s < 60 * 60) {
        str = Math.round(s / 60) + "m";
      } else {
        str = date
      }
      div.setHTML(str);
    }
    window.setTimeout(DynamicTime.loop, 1000);
  },
  init: function() {
    addEventListener('DOMContentLoaded', (event) => {
      DynamicTime.loop();
    });
  }
};
export default DynamicTime;
