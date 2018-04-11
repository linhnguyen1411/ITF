$(document).ready(function(){
  $(document).on('click','.btn-reaction',function(){
    var target_type = $(this).data('target');
    var reactionable_type = $(this).data('type');
    var reactionable_id = $(this).data('id');

    $.ajax({
      url: '/reactions',
      type: 'POST',
      dataType: 'script',
      data: {
        target_type: target_type,
        reactionable_id: reactionable_id,
        reactionable_type: reactionable_type
      }
    });
  });
});
