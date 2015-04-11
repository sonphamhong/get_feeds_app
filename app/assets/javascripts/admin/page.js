jQuery( function($){
  $(".load_feeds_button").on('click', function(e) {
    url = $("#get_feeds_path").val();
    id_page = $(this).attr("id_page");
    console.log(id_page);
    $.ajax({
      url: url,
      type: 'get',
      data: {id: id_page},
      success: function(data){
        alert("ok");
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError);
      }
    })
  });
});
