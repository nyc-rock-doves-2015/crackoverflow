$(document).on('ready page:load', function() {

  $('.question-container').on('click', '.fa-star-o', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)

    $.ajax({
      url: '/favorites', 
      type: "POST",
      data: {question_id: $('.question-id').html()}
    }).done(function(response) {
      $target.removeClass('fa-star-o');
      $target.addClass('fa-star');
      $('.favorite-count').html(response);
    })
  })

  $('.question-container').on('click', '.fa-star', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)
    var $questionId = $('.question-id').html()

    $.ajax({
      url: '/favorites/' + $questionId, 
      type: "DELETE",
      data: {question_id: $questionId}
    }).done(function(response) {
      $target.removeClass('fa-star');
      $target.addClass('fa-star-o');
      $('.favorite-count').html(response);
    })
  })

})
