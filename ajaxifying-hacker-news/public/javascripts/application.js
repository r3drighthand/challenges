$(document).ready(function() {

  // This is the upvote logic
  $('.post-container').on('submit', 'form.upvote', function(event) {
      event.preventDefault();
      var $form = $(this)
      var url = $form.attr('action');
      //$ for humans
      $form.find('.upvote-button').css({color: 'orange'})
      var $request = $.ajax({
        url: url,
        method: "post",
        dataType: "json"
      })
      $request.done(function(serverResponse){
        var $pointsSpan = $form.closest('article').find('.points')
        $pointsSpan.text(serverResponse.votes_count)
      })
  });
  // This is delete logic:
  $('.post-container').on('click', 'a.delete', function(event){
    event.preventDefault();
    var $deleteButton = $(this);
    var url = $deleteButton.attr('href');

    var $request = $.ajax({
      url: url,
      method: 'delete'
    });
    $request.done(function(serverResponseAgain){
      $deleteButton.closest('article').remove()
    })
  });
//This is the create logic!

  $('#posts').on('submit', function(event) {
  event.preventDefault();
    var $form = $(this)
    var url = $form.attr('action');
    var $request = $.ajax({
        url: url,
        method: "post",
        data: $form.serialize()
      })
    console.log($form.serialize());

    $request.done(function(serverResponse){
      $('.post-container').append(serverResponse);
      $('#posts')[0].reset();
    })

    $request.fail(function(serverResponse){
      $('#posts').prepend(serverResponse.responseText)
    })

  });

});


