Pig.Sortable = {
  init: function() {
    $('.sortable').sortable({
      placeholder: 'well well-placeholder',
      containment: 'parent'
    });
    return $('a.sortable-submit').click(function(event) {
      var url;
      url = $(this).attr('href') + '?';
      url += $('.sortable').sortable("serialize");
      return $(this).attr('href', url);
    });
  }
}
