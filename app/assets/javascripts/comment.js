$(document).on('ready page:load', function() {

  $('.answer-container').on('click', '.comment-add-link', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)
    $target.hide();
    // $target.closest('.comment-list').append

  })

})