(function($){
  $(function(){

    var $tweets = $("#tweets");

    $('.button-collapse').sideNav();

    $(".searchTweet").click(function(event){

      event.preventDefault();

      var searchWord = $(".searchword").val(); 

      $.post("/results", { word: searchWord }).then(function(tweets){
        $tweets.empty();
        $tweets.append("<div class='row'><div class='col s3 offset-s1'><a href='/analyses' class='btn'> Analyze Tweets </a></div></div>");
        $tweets.append(tweets.map(function(tweet){
          return $("<div class='col s12 m4'>" +
                    "<div class='card blue-grey darken-1 tweet-cards z-depth-3 display-cards'>" +
                    " <div class='card-content white-text'>" + 
                    "<span class='card-title'> <a href='https://twitter.com/" +
                    tweet.table.screen_name + 
                    "' target='_blank'> @" + 
                    tweet.table.screen_name + 
                    "</a>" + "</span> <p> " + 
                    tweet.table.text + 
                    "</p> </div> <div class='card-action card-foot blue-text text-lighten-4'><h6> " + 
                    new Date(tweet.table.created_at).toLocaleDateString() + 
                    "</h6></div></div> </div>");
        }));
      })
      .fail(function() {
        alert('Something went horribly wrong.')
      });

    });

      $('.parallax').parallax();
  }); // end of document ready
})(jQuery); // end of jQuery name space