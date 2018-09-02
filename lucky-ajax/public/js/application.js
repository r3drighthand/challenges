$(document).ready(function () {
  $("form").on("submit", function(e){
    e.preventDefault();

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
      $("#die-container").html(response);
    })

  })

});