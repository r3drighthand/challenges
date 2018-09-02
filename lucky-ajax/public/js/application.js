$(document).ready(function () {
  $("form").on("submit", function(e){
    e.preventDefault();
    //console.log($(this));

    var $form = $(this);
    var method = $form.attr("method");
    var url = $form.attr("action");
    var data = $form.serialize();

    $.ajax({
      method: method;
      url: url,
      data: data
    })
    .done(function(response){
      // console.log(response);
      $("#die-container").html(response);
    })

  })

});