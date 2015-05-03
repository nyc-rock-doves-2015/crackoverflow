$(document).on('ready page:load', function() {

  $('.post-container').on('click', '.fa-check', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)
    var $answerId = $target.closest('.post-container').find('.post-id').html();

    $.ajax({
      url: '/answers/best', 
      type: "GET",
      data: {answer_id: $answerId}
    }).done(function(response) {
      $('.fa-check').removeClass('.toggle-green')
      $target.addClass('toggle-green');
      $target.css("color", "green");
    }).fail(function() {
      window.location.replace("/sessions/new")
    })
  })

})
