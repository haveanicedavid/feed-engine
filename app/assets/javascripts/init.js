(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.parallax').parallax();

    $(".search").click(function(){

      var searchWord = $(".searchword").val(); 
    $.ajax({
      type: "POST",
      url: "/searches?searchword="+searchWord,
      data: {"word":searchWord},
      success:function(tweets){
        console.log(tweets);
      }
    });

    });

  }); // end of document ready
})(jQuery); // end of jQuery name space