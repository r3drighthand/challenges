$(document).ready(function(){
  $('#post_form').on("submit", function(e){
    e.preventDefault();

    var $form = $(this);
    console.log($form);

    var formUrl = $form.attr("action");
    var formMethod = $form.attr("method");
    var formData = $form.serialize();

    $.ajax({
      method: formMethod,
      url: formUrl,
      data: formData
    })
    .done(function(response){
      console.log(response);
      $('#posts').prepend(response);
      $form[0].reset();
    });
  });

  $("#posts").on("submit", ".post_like", function(e){
    e.preventDefault();

    var $likeForm = $(this);
    var likeFormUrl = $likeForm.attr("action");
    var likeFormMethod = $likeForm.children().first().val();

    $.ajax({
      method: likeFormMethod,
      url: likeFormUrl
    })
    .done(function(response){
      var likeCount = $likeForm.parent().find(".like_count");
      likeCount.text(response);
    });
  });
});
