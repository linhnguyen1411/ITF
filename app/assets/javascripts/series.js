$(document).ready(function(){
  $(document).on('click','.add-post',function(){
    if($(this).closest('.media-group').hasClass('selected')){
      $(this).closest('.media-group').removeClass('selected');
      var post_id = $(this).data('id');
      var index = $('#post_list_modal').data('post-ids').indexOf(post_id);
      if (index > -1) {
        $('#post_list_modal').data('post-ids').splice(index, 1);
      }
    }else {
      var post_id = $(this).data('id');
      $(this).closest('.media-group').addClass('selected');
      $('#post_list_modal').data('post-ids').push(post_id);
    }
  });

  $(document).on('click','.btn-accept-add-posts',function(){
    var post_ids =  $('#post_list_modal').data('post-ids').join(',');
    $.ajax({
      url: window.location.pathname  + '?post_ids=' + post_ids,
      type: 'PUT',
      dataType: 'html',
      success: function (data) {
        window.location.replace(window.location.pathname);
      },
      error: function () {
        response([]);
      }
    });
  });
  $('#post_list_modal').on('hidden.bs.modal', function () {
    $('#post_list_modal').data('post-ids', $('#post_list_modal').data('current'));
  })
});
