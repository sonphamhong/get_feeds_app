jQuery( function($){
  $(".del_artice_button").on('click', function(e) {
    var r = confirm("are you sure?");
    if (r == true) {
      url = $(this).attr("link");
      $.ajax({
        url: url,
        type: "delete",
        success: function(result){
          console.log(result);
          alert("ok!");
          location.reload();
        },
        error: function (xhr, ajaxOptions, thrownError) {
          alert(xhr.status);
          alert(thrownError);
        }
      })
    }
  });
});
