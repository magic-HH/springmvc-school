$(function () {
    //新消息提醒用户
    $('.fa-circle').css('display', 'none');
    var timeTask = setInterval(function () {
        getRmsg();
    }, 5000)
    function getRmsg() {
        //  //inline-block  显示
        var userId = $('#userId').val();
            $.ajax({
                url: 'getNotice',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // var html = template('newMsg', data);
                    var html = "";

                    for (var i in data) {
                        $('.fa-circle').css('display', 'inline-block ');
                        html += '<div class="dropdown-divider"></div>' +
                            '<a class="dropdown-item"  href="msgShow" ' +
                            '<span class="text-success">' +
                            '<strong>' +
                            '<i class="fa fa-commenting-o" aria-hidden="true"></i></strong>' +
                            '</span>' +
                            '<span>&nbsp;&nbsp; 提示:</span>'+
                            '<span class="small float-right text-muted" style="">' + data[i].time+'</span>' +
                            '<div class="dropdown-message small">' + data[i].msgs + '</div>' +
                            '</a>'
                    }
                    if(data=="0"){
                        $('.fa-circle').css('display', 'none');
                    }
                    document.querySelector('.msg').innerHTML = html;
                }
            });
    }

});

