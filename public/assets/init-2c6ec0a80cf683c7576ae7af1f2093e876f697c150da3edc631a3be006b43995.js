(function($){
  $(function(){

    var $tweets = $("#tweets"); // Tweets selector

    $('.button-collapse').sideNav();

    $(".searchTweet").click(function(event){ // Jquery to run Ajax on tweet display


      console.log("hello");
      event.preventDefault();
      var searchWord = $(".searchword").val();  // Word being searched

      $.post("/results", { word: searchWord }).then(function(tweets){
        $tweets.empty();
        $tweets.append("<div class='row'><div class='col s3 offset-s1'><a href='/analyses' class='btn cyan darken-2'> Analyze '" + searchWord +  "'</a></div></div>");
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
    // Scrollfire
      var options = [
          {selector: '#staggered-test', offset: 300, callback: 'Materialize.toast("OOOohhhh!!", 1500 )' },
          // {selector: '#staggered-test', offset: 205, callback: 'Materialize.toast("Please continue scrolling!", 1500 )' },
          {selector: '#staggered-test', offset: 250, callback: 'Materialize.showStaggeredList("#staggered-test")' },
          // {selector: '#image-test', offset: 500, callback: 'Materialize.fadeInImage("#image-test")' }
        ];
        Materialize.scrollFire(options);

      $('.parallax').parallax(); // Handles parallax scrolling
  }); // end of document ready
})(jQuery); // end of jQuery name space
