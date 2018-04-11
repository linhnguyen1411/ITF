function move_panel_vote() {
  $(window).scroll(function(){
    if ($(window).scrollTop() < ($('.post-content').height() )) {
      $('.vote-post').stop().animate({'marginTop': ($(window).scrollTop()) + 'px'}, 'fast' );
    }
  });
};

$(document).ready(function(){
  move_panel_vote();
});
