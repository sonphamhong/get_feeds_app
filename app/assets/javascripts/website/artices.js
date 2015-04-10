jQuery( function($){
  $("#save_post_to_user_button").on('click', function(e) {
    id_artice = $(this).attr("id_artice");
    url = $("#save_post_to_user_path").val();
    console.log(url);
    $.ajax({
      url: url,
      type: 'post',
      data: {id: id_artice},
      success: function(data){
        alert(data.result);
      }
    })
  });
});
