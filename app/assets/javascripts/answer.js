$(document).on('ready page:load', function () {
  $('.post-container').on("submit", ".new_answer", function (event) {
    event.preventDefault();
    $answercount = $('#answer-count');
    $target = $(event.target);
    if($('#answer_content').val() != ""){
      $.ajax({
        url: $target.attr("action"),
        type: "post",
        data: $target.serialize()
      }).done(function (response) {
        $('#answer').prepend(response);
        $('#answer_content').val('');
        $answercount.html((parseInt($answercount.html()) + 1));
        $('.comment-new-form').hide()
      });
    } else {
      alert("Answer content cannot be empty");
    }
  });
});