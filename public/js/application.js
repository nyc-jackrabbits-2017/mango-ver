
$(document).ready(function(e) {
  $("body").on("submit", "form[action='/votes']", function(e)  {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: $(e.target).attr('action'),
      data: $(e.target).serialize()
    }).done(function(r)  {
      $(e.target).parent().html(r);
    });
  });

  $("#display-question-form").on("click", function(event) {
    event.preventDefault();
    $(this).hide();
    var url = $(event.target).attr("href");

    $.ajax({
      method: "get",
      url: url
    }).done(function(response) {
       $(".container").append(response);
    })

  });

  $(".container").on("submit","#show-question", function(event){
    event.preventDefault();
    var data = $(event.target).serialize();

    $.ajax({
       url: '/questions',
       method: 'post',
       data: data

    }).done(function(response) {
       $("#question-list").append(response);
    });

  });


});
