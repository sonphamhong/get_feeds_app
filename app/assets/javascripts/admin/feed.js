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

  $("[id^='published_switch']").on('click', function(e) {
    parent = $(this).parent();
    url = parent.children('input[type=hidden]').val();
    status_check_box = $(this).is(':checked');
    console.log(status_check_box);
    $.ajax({
      url: url,
      type: 'get',
      data: {status: status_check_box},
      success: function(result){
        console.log(result);
      }
    })
  });
});
