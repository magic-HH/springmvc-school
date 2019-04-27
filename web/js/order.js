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
})