(function($){
  $(function(){

    var $tweets = $("#tweets");

    $('.button-collapse').sideNav();
    $('.parallax').parallax();

    $(".searchTweet").click(function(event){

      event.preventDefault();

      var searchWord = $(".searchword").val(); 

      $.post("/results", { word: searchWord }).then(function(tweets){
        $tweets.empty();
        $tweets.append(tweets.map(function(tweet){
          return $("<div class='col s12 m4'> <div class='card blue-grey darken-1 tweet-cards z-depth-3 display-cards'> <div class='card-content white-text'> <span class='card-title'>" + tweet.table.text + "</span> </div> </div> </div>");
        }));
      })
      .fail(function() {
        alert('Something went horribly wrong.')
      });

    });

  }); // end of document ready
})(jQuery); // end of jQuery name space