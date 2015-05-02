$(document).on('ready page:load', function() {

  $('.favorite-toggle').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    $target = $(event.target)

    // $.ajax({
    //   url: '/favorites', 
    //   type: "POST",
    //   data: {question_id: }

    $target.hide();
  })

})
