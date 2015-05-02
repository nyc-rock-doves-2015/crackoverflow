$(document).on('ready page:load', function () {
  $('.post-container').on("click", '.vote-link', function (event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target).parent();
    var $reputation = $target.parent().children('.reputation')
    var $userReputation = $target.closest('.post-container').find('.user-reputation')
    $.ajax({
      url: $target.attr('href'),
      type: 'post'
    }).done(function (response) {
      var resArray = response.split("|")
      $reputation.html(resArray[0])
      $userReputation.html(resArray[1])
    });
  });
});