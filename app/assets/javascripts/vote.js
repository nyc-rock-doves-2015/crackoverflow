$(document).on('ready page:load', function () {
  $('.post-container').on("click", '.vote-link', function (event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)
    var $reputation = $target.parent().children('.reputation');
    var userClass = '.' + $target.closest('.post-container').find('.user-reputation').attr('class').split(' ')[1]
    var $userReputation = $(userClass)
    var $postId = $target.closest('.post-container').find('.post-id').html();
    var $voteDecision = $target.attr('id') === "upvote-link"

    $.ajax({
      url: '/vote',
      type: 'post',
      data: {post_id: $postId, vote: $voteDecision }
    }).done(function (response) {
      if ($voteDecision) {
        $target.closest('.vote-container').children('#downvote-link').removeClass('down-toggle')
        $target.toggleClass('up-toggle');
      }
      else {
        $target.closest('.vote-container').children('#upvote-link').removeClass('up-toggle')
        $target.toggleClass('down-toggle')
      }
      
      var resArray = response.split("|")
      $reputation.html(resArray[0])
      $userReputation.html(resArray[1])
    });
  });


});