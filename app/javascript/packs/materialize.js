$(document).ready(function(){
  $('.parallax').parallax();
});
$(document).ready(function() {
  $('input#input_text, textarea#textarea2').characterCounter();
});
$(document).ready(function(){
  $('select').formSelect();
});
$(document).ready(function(){
  $('.datepicker').datepicker({
    i18n:{
      months: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
      monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
      weekdaysShort: ["日", "月", "火", "水", "木", "金", "土"],
      weekdaysAbbrev: ["日", "月", "火", "水", "木", "金", "土"],
      done: "決定",
      clear: "クリア",
      cancel: "キャンセル"
    },
    showClearBtn: true,
    autoClose: true,
    format: "yyyy年mm月dd日(ddd)"
  });
});
