$(function() {
  // 显示商品
  $.get('', function(data) {})
  // 添加商品
  $('.addBtn').on('click', function() { 
    $('.addModal').modal('show'); 
    $('.addModal .submit').on('click', function() {
      $('.addModal').modal('hide');
      $.post('', $('.addModal form').serialize(), function(data) {
        console.log(data);
        location.reload();
      })
    })
  });
  // 修改数据
  $('.foodPrice').on('dblclick', function() {
    var txt = $('.foodPrice').text().slice(1);
    var newInput = `<input type="text" class="editPrice" value="${txt}">`;
    $('.foodPrice').html(newInput);
    var t = $('.editPrice').val();
    $('.editPrice').val('').focus().val(t);
    // 保存数据
    $('.saveBtn').on('click', function() {
      var a = $('.editPrice').val();
      var fid = $(this).parents('.food').attr('fid');
      $.get(`/?id=${fid}$a=${a}`, function(data) {
        $('.foodPrice').html(`￥${a}`);
      })
    })
  })
  // 删除数据
  $('.delBtn').on('click', function() {
    if(!confirm('是否删除该商品')) return;
    var fid = $(this).parents('.food').attr('fid');
    $.get(`/?id=${fid}`, function() {
      $(this).parents('.food').remove();
    })
  })
});
