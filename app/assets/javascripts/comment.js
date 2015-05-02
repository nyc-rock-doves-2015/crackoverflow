$(document).on('ready page:load', function() {

  $('.comment-new-form').hide()

  $('.post-container').on('click', '.comment-add-link', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target)
    $target.hide();
    $target.closest('.comment-container').find('.comment-new-form').show();

  })

  $('.post-container').on('submit', '.comment-new-form', function(event) {
    event.preventDefault();

    var $target = $(event.target);
    var $postId = $target.closest('.post-container').children('.post-id').html();
    var $commentContainer = $target.closest('.comment-container')

    $.ajax({
      url: '/comments',
      type: "post",
      data: $target.serialize() + "&post_id=" + $postId
    }).done(function(response) {
      $commentContainer.children('.comment-list').append(response);
      $commentContainer.find('.comment-add-link').show();
      $target.find('.comment-new-content').val('')
      $target.hide();
    })

  })

})