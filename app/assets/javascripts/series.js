$(document).ready(function(){
  $(document).on('click','.add-post',function(){
    var post_id = $(this).data('id');
    $(this).closest('.media-group').addClass('selected');
    $('.btn-accept-add-posts').data('post-ids') = $('.btn-accept-add-posts').data('post-ids') + post_id
  });
});
