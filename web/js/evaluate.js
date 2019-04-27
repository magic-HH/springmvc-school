$(function() {
  //新消息提醒用户
  var userId = $('#userId').val();
  $.ajax({
    url: '' + userId,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      var html = template('newMsg', data);
      switch(data.num) {
        case '0': data.text = ''; break;
        case '1': {
          data.text = '';
          $('fa-circle').css('display', 'block');
        };break;
        case '2': data.text = ''; break;
        case '3': data.text = ''; break;
      }
      document.querySelector('.msg').innerHTML = html;
    }
  });
  //注销用户
  $('.fa-sign-out').on('click', function(){
    $.get('', function(data) {
      location.href = 'index.html';
    })
  })
  //星级评分
  var num = 4;
  $('.stars li').on('mouseover', function(e) {
    for(var i = 0; i < 5; i++) {
      $('.stars li').css('color', 'gray');
      $(this).css('color', 'red').prevAll().css('color', 'red');
      num = $(this).attr('num');
    }
  })
  // 评价
  $('.foot input').on('click', function() {
    var txt = $('textarea').val();
    var data = {text: txt, number: num};
    console.log(data);
    $.post('', data, function(data) {
      console.log(data);
    })
  })
})