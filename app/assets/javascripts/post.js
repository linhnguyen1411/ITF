function move_panel_vote() {
  $(window).scroll(function(){
    if ($(window).scrollTop() < ($('.post-content').height() )) {
      $('.vote-post').stop().animate({'marginTop': ($(window).scrollTop()) + 'px'}, 'fast' );
    }
  });
};

function show_cover_image_input() {
  var value = $('#post_type').val();
  if(value === 'question')
    $('#imgInp').closest('.form-group').hide('500');
  else
    $('#imgInp').closest('.form-group').show('500');
}
$(document).ready(function(){
  move_panel_vote();
  show_cover_image_input();
  $('#post_type').change(function(){
    show_cover_image_input();
  });
});
