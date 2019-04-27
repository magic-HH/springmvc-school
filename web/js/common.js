$(function() {
  // 监听浏览器滚动，头部
  $(window).scroll(function() {
    var topp = $(document).scrollTop();
    if(topp > 80) {
      $('#header .container').addClass('top');
      $('#logoArea').css('marginBottom', '0');
    }else {
      $('#header .container').removeClass('top');
      $('#logoArea').css('marginBottom', '20px');
    }
  })
})