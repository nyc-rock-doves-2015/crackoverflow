$(document).ready(function () {
  $('.new_answer').on("submit", function (event) {
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr("action"),
      type: "post",
      data: $target.serialize()
    }).done(function (response) {
      $('#answer').prepend(response);
      $('#answer_content').val('')
    })
  })
})