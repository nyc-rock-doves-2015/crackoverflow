$(document).on('ready page:load', function () {
  $('#search-bar .typeahead').typeahead({
    prefetch: 'http://localhost:3000/suggestion.json',
    hint: true
  });
});