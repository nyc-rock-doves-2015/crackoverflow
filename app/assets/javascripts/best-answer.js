$(document).on('ready page:load', function() {

  $('.post-container').on('click', '.fa-check', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)
    var $answerId = $target.closest('.post-container').find('.post-id').html();
    var $questionId = $('.question-container').children('.post-id').html();

    $.ajax({
      url: '/questions/' + $questionId + '/best', 
      type: "GET",
      data: {answer_id: $answerId}
    }).done(function(response) {
      $('.fa-check').removeClass('green-toggle')
      $target.addClass('green-toggle');
    }).fail(function() {
      // window.location.replace("/sessions/new")
    })
  })

})
