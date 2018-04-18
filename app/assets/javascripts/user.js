$(document).on('click', '.follow a', function(){
  var element = $(this);
  var followable_id = $(this).data('f-id');
  var method = $(this).data('method');
  var followable_type = $(this).data('f-type');
  var id = $(this).data('id');
  $.ajax({
    url: '/follows/' + id,
    type: method,
    dataType: 'json',
    data: {
      followable_type: followable_type,
      followable_id: followable_id
    },
    success: function (data) {
      if(data.type === 'follow'){
        element.removeClass('btn-success');
        element.addClass('btn-warning');
        element.data('method', 'delete');
        element.closest('.user-item').find('.ticker-follow-false')
          .removeClass('ticker-follow-false').addClass('ticker-follow-true');
        element.text(I18n.t('users.user.unfollow'));
        element.data('id', data.id);
      }else if(data.type === 'unfollow') {
        element.removeClass('btn-warning');
        element.addClass('btn-success');
        element.data('method', 'post');
        element.closest('.user-item').find('.ticker-follow-true')
          .removeClass('ticker-follow-true').addClass('ticker-follow-false');
        element.text(I18n.t('users.user.follow'));
        element.data('id', '');
      }
    },
    error: function () {
      response([]);
    }
  });
})
