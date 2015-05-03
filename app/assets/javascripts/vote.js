$(document).on('ready page:load', function () {
  $('.post-container').on("click", '.vote-link', function (event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target).parent();
    var $reputation = $target.parent().children('.reputation');
    var $userReputation = $target.closest('.post-container').find('.user-reputation');
    var $postId = $target.closest('.post-container').find('.post-id').html();
    var $voteDecision = $target.attr('id') === "upvote-link"

    $.ajax({
      url: $target.attr('href'),
      type: 'post',
      data: {post_id: $postId, vote: $voteDecision }
    }).done(function (response) {
      var resArray = response.split("|")
      $reputation.html(resArray[0])
      $userReputation.html(resArray[1])
    });
  });
});