$(document).ready(function(){
  $(document).on('click', '.show-reply-form', function(){
    var post_id = $(this).data('post-id');
    var post_type = $(this).data('post-type');
    var parent_id = $(this).data('parent-id');
    $.ajax({
      url: '/replies/new?post_id=' + post_id + '&post_type=' + post_type + '&parent_id=' + parent_id,
      type: 'GET',
      dataType: 'script'
    });
    $(this).removeClass('show-reply-form');
    $(this).addClass('hide-reply-form');
    if(post_type){
      $(this).html('<i class="fa fa-times-circle-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.' + post_type + '.cancel_reply'));
    }else{
      $(this).html('<i class="fa fa-times-circle-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.cancel_reply'));
    }
  });

  $(document).on('click', '.hide-reply-form', function(){
    var post_type = $(this).data('post-type');
    var parent_id = $(this).data('parent-id');
    $('#reply_form_' + parent_id).slideUp(500).hide(500);
    if(post_type){
      $(this).html('<i class="fa fa-pencil-square-o" aria-hidden="true"></i> '
        + I18n.t('posts.show.' + post_type + '.post_reply'));
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
