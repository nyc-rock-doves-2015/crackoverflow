$(document).on('ready page:load', function () {
  $('.new_answer').on("submit", function (event) {
    event.preventDefault();
    $answercount = $('#answer-count');
    $target = $(event.target);
    $.ajax({
      url: $target.attr("action"),
      type: "post",
      data: $target.serialize()
    }).done(function (response) {
      $('#answer').prepend(response);
      $('#answer_content').val('');
      $answercount.html((parseInt($answercount.html()) + 1));
    });
  });
});