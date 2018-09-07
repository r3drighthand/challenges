$(document).ready(function(){
  var recentTweetPromise = $.ajax({
    url:"tweets/recent",
    method: "GET"
  });

  recentTweetPromise.done(function(response){
    var $tweetFormat = $(".tweet").first();
    $('#tweets-container > ul').empty();
    for (var i = 0; i < response.length; i++) {
      var $newTweet = $tweetFormat.clone()
      $newTweet.find(".avatar").attr("src", response[i].avatar_url)
      $newTweet.find(".full-name").text(response[i].username)
      $newTweet.find(".username").text(response[i].handle)
      $newTweet.find(".timestamp").text(moment(response[i].created_at).fromNow())
      $newTweet.find("#tweet-body").html(highlightHashtags(response[i].content))
      $('#tweets-container > ul').append($newTweet)
    }
  })

  var recentTrendsPromise = $.ajax({
    url:"hashtags/popular",
    method: "GET"
  });

  recentTrendsPromise.done(function(response){
    console.log(response)
    $('#trends-container > ul').empty();
    for (var i = 0; i < response.length; i++) {
      $('#trends-container > ul').append("<li>"+response[i].name+"</li>")
    }
  })

  $("#tweet-form").on("submit", handleNewTweet)

  $("#search").on("keypress", searchTweets)
  $("#trends-container").on("click", "li", searchTweets)
  $("#tweets-container").on("click", ".tag", searchTweets)
})

var highlightHashtags = function(tweetContent) {
  var hashtagRegex = /(#[\w]+)/g;
  return tweetContent.replace(hashtagRegex, '<a class="tag">$1</a>')
}

var populateTweet = function(response){
  var $cloneTweet = $(".tweet").first().clone();
  $cloneTweet.find(".avatar").attr("src", response.avatar_url)
  $cloneTweet.find(".full-name").text(response.username)
  $cloneTweet.find(".username").text(response.handle)
  $cloneTweet.find(".timestamp").text(moment(response.created_at).fromNow())
  $cloneTweet.find("#tweet-body").html(highlightHashtags(response.content))
  return $cloneTweet;
}

var findHashtags = function(tweet) {
  var matchArray = tweet.match(/#([\w]+)/g);
  matchArray = matchArray.map(function(match){
    return match.slice(1)
  })
  return matchArray
}

var handleNewTweet = function(event) {
  event.preventDefault();
  var $this = $(this)
  var tweetContent = $this.find("textarea").val()
  var hashtags = findHashtags(tweetContent);
  var data = {
    "tweet" : {
      "content" : tweetContent
    },
    "hashtags" : hashtags
  }
  var newTweetPromise = $.ajax({
    url: "tweets",
    method: "POST",
    data: data
  })

  newTweetPromise.done(function(response){
    $this[0].reset();
    $(populateTweet(response)).hide().prependTo("#tweets-container > ul").show("slow")
  })
}

var searchTweets = function(e) {
  var key = e.which || e.keyCode;
  var $keyword;
    console.log($(this).text())
  if ($(this).text()) {
    $keyword = $(this).text()
    var url = "tweets/search/" + $keyword
    var searchPromise = $.ajax({
      url: url,
      method: "GET"
    })
  } else if (key === 13) {
    e.preventDefault();
    $keyword = $("#search").val()
    var url = "tweets/search/" + $keyword
    var searchPromise = $.ajax({
      url: url,
      method: "GET"
    })
  }

  //
}

