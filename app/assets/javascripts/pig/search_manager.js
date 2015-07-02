// handles page search - uses navAutocomplete widget
window.SearchManager = {
  init: function() {
    function loadContentPageInTree(url) {
      $.ajax({
        type: 'GET',
        url: url,
        dataType: "script"
      }).always(function() {
        $("#content_search_link").val('');
      });
      return false;
    }

    $("#content_search_link").navAutocomplete({
      source: $("#content_search_link").data("search-url"),
      minlength: 2,
      select: function(event, ui) {
        loadContentPageInTree(ui.item.open_url);
      }
    });

    $("#content_search_link").on("click", function() {
      return this.select();
    });
  }
};
