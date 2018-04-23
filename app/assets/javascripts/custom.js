$(document).ready(function(){
  $(document).on('click','.delete',function(){
    var id =  $(this).data('id');
    var controller =  $(this).data('controller');
    var reload =  $(this).data('reload');
    var klass =  $(this).data('klass');
    swal({
      useRejections: true,
      title: I18n.t('warning'),
      text: I18n.t('are_you_sure', {resource: klass}),
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: I18n.t('ok'),
      cancelButtonText: I18n.t('cancel'),
      closeOnConfirm: false
    }).then(function() {
      $.ajax({
        url: '/' + controller + '/' + id + '?reload=' + reload,
        type: 'delete',
        dataType: 'json',
        success: function (data) {
          if(reload)
            window.location.replace(data);
          else
            $('#reply_' + id).slideUp(500);
        },
        error: function () {}
      }).done();
    });
  });
});
