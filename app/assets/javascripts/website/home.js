jQuery( function($){
  $("#user_sign_in_button").on('click', function(e) {
    $("#profile_user").slideToggle();
  });
  $("#custom_user_dropdown li").hover(function() {
    $(this).addClass('active');
  }, function(){
    $(this).removeClass('active');
  });
});