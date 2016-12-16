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
});
