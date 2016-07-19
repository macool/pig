Pig.ContentType = (function() {
  var duplicateSeedId;

  init = function() {
    // clicking a row will open, fetch then open, or close the branch
    $('.sitemap').on('click', 'td.td-name', function() {
      var content_type_id, depth, link, row;
      link = $(this);
      row = link.parent();
      if ($(this).data('open') === 1) {
        closeBranch(link, row);
      } else if ($(this).data('loaded') === 1) {
        openBranch(link, row);
      } else {
        getBranch(link, row);
      }
    });
    
    // open a model with option to duplicate a template
    $('.js-duplicate-link').on('click', function() {
      duplicateSeedId = $(this).data('content-type-id');
      $('#duplicate-modal').modal();
    });
    $('.js-duplicate-submit').on('click', function(event) {
      var duplicateTo, path;
      path = $(event.currentTarget).data('duplicate-url').replace(':id', duplicateSeedId)
      duplicateTo = $('#duplicate_to').val();
      if (duplicateTo !== "") {
        path += "?to=" + duplicateTo;
      }
      window.location = path;
    });
  }

  closeBranch = function(link, row) {
    link.data('open', 0);
    link.find('i.sitemap-caret').removeClass('fa-caret-down').addClass('fa-caret-right');
    depth = row.data('depth');
    while (true) {
      row = row.next();
      if (row.data('depth') > depth) {
        row.hide();
        link = row.find('td.td-name');
        link.data('open', 0);
        link.find('i.sitemap-caret').removeClass('fa-caret-down').addClass('fa-caret-right');
      } else {
        break;
      }
    }
  }
  
  openBranch = function(link, row) {
    link.data('open', 1);
    link.find('i.sitemap-caret').removeClass('fa-caret-right').addClass('fa-caret-down');
    depth = row.data('depth');
    _results2 = [];
    while (true) {
      row = row.next();
      if (row.data('depth') != null) {
        if (row.data('depth') === (depth + 1)) {
          row.show();
        } else if (row.data('depth') === depth) {
          break;
        }
      } else {
        break;
      }
    }
  }

  getBranch = function(link, row) {
    content_type_id = row.attr('id').split('-').slice(-1)[0];
    link.data('loaded', 0);
    setTimeout("loading(" + content_type_id + ")", 250);
    $.get(row.data('open-url')).success(function() {
      link.data('loaded', 1);
      link.data('open', 1);
      link.find('i.sitemap-caret').removeClass('fa-spin').removeClass('fa-spinner').removeClass('fa-caret-right');
      link.find('i.sitemap-caret').addClass('fa-caret-down');
    });
  }

  loading = function(id) {
    var link;
    link = $("#content-type-" + id + " td.td-name");
    if (link.data('loaded') === 0) {
      link.find('i.sitemap-caret').removeClass('fa-caret-right').addClass('fa-spinner').addClass('fa-spin');
    }
  }

  return { init: init };
})();
