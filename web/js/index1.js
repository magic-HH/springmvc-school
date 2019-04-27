$(function() {
// 点击添加，购物车数量增加
  $('.addBtn').on('click', function(e) {
    e.preventDefault();
    var fid = $(this).attr('fid');
// 发送ajax请求，自增
    var num = $('.num').text(parseInt($('.num').text())+1);
  })

})