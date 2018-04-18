$(document).ready(function(){
  $(document).on('click', '.show-reply-form', function(){
    var replyable_id = $(this).data('replyable-id');
    var replyable_type = $(this).data('replyable-type');
    var type = $(this).data('type');
    var parent_id = $(this).data('parent-id');
    $.ajax({
      url: '/replies/new?replyable_id=' + replyable_id + '&replyable_type='
        + replyable_type + '&type=' + type + '&parent_id=' + parent_id,
      type: 'GET',
      dataType: 'script'
    });
    $(this).removeClass('show-reply-form');
    $(this).addClass('hide-reply-form');
    if(type){
      $(this).html('<i class="fa fa-times-circle-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.' + type + '.cancel_reply'));
    }else{
      $(this).html('<i class="fa fa-times-circle-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.cancel_reply'));
    }
  });

  $(document).on('click', '.hide-reply-form', function(){
    var type = $(this).data('type');
    var parent_id = $(this).data('parent-id');
    $('#reply_form_' + parent_id).slideUp(500).hide(500);
    if(type){
      $(this).html('<i class="fa fa-pencil-square-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.' + type + '.post_reply'));
    }else{
      $(this).html('<i class="fa fa-times-circle-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.post_reply'));
    }

    $(this).removeClass('hide-reply-form');
    $(this).addClass('show-reply-form');
  });

  $(document).on('click', '.link-to-view-more', function(){
    $(this).closest('.thread-children-reply').find('.chidrent-reply').slideDown(500);
    $(this).slideUp(100);
  });
});
