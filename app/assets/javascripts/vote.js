$(document).on('ready page:load', function () {
  $('.post-container').on("click", '.vote-link', function (event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target).parent();
    var $reputation = $target.parent().children('.reputation')
    $.ajax({
      url: $target.attr('href'),
      type: 'post'
    }).done(function (response) { 
      $reputation.html(response)
    });
  });
});