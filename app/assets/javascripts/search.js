$(document).on('ready page:load', function () {
  $('.typeahead').typeahead([
    {
      prefetch: 'http://localhost:3000/suggestion.json'
    }
  ]);
});