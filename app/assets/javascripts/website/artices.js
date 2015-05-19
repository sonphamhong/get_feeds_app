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
        ShowCustomDialog();
      }
    })
  });

  $("[id^='delete_article_user_button']").on('click', function(e) {
    id_artice = $(this).attr("id_artice");
    url = $("#del_article_user_path").val();
    console.log(url);
    $.ajax({
      url: url,
      type: 'get',
      data: {id: id_artice},
      success: function(data){
        console.log(data);
        if (data.result == "ok") {
          ShowCustomDialog();
        };
      }
    }) 
  });

  function ShowCustomDialog(){     
    ShowDialogBox('Warning','Record updated successfully.','Ok','', 'GoToAssetList',null);
  }

  function ShowDialogBox(title, content, btn1text, btn2text, functionText, parameterList) {
    var btn1css;
    var btn2css;

    if (btn1text == '') {
        btn1css = "hidecss";
    } else {
        btn1css = "showcss";
    }

    if (btn2text == '') {
        btn2css = "hidecss";
    } else {
        btn2css = "showcss";
    }
    $("#lblMessage").html(content);

    $("#dialog").dialog({
        resizable: false,
        title: title,
        modal: true,
        width: '400px',
        height: 'auto',
        bgiframe: false,
        hide: { effect: 'scale', duration: 400 },

        buttons: [
                  {
                    text: btn1text,
                    "class": btn1css,
                    click: function () {                       
                        $("#dialog").dialog('close');
                        location.reload();
                    }
                  },
                  {
                      text: btn2text,
                      "class": btn2css,
                      click: function () {
                          $("#dialog").dialog('close');
                          location.reload();
                      }
                  }
                ]
    });
  }
});
