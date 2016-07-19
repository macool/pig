Pig.Sitemap = {
  init: function() {
    Pig.Sitemap.filter();
    $('select#status').change(function() {
      return Pig.Sitemap.filter();
    });
    return $('#sitemap').on('click', '.has-children td.td-name', function(e) {
      var content_package_id, depth, link, row, _results, _results2;
      link = $(this);
      row = link.parent();
      if ($(this).attr('data-open') === '1') {
        link.attr('data-open', 0);
        link.find('i.sitemap-caret').removeClass('fa-caret-down').addClass('fa-caret-right');
        depth = row.data('depth');
        _results = [];
        while (true) {
          row = row.next();
          if (row.data('depth') > depth) {
            row.hide();
            link = row.find('td.td-name');
            link.attr('data-open', 0);
            link.find('i.sitemap-caret').removeClass('fa-caret-down').addClass('fa-caret-right');
          } else {
            break;
          }
        }
        if (e.originalEvent !== undefined)
          Pig.Sitemap.setCookie();
        return _results;
      } else if ($(this).data('loaded') === 1) {
        link.attr('data-open', 1);
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
        if (e.originalEvent !== undefined)
          Pig.Sitemap.setCookie();
        return _results2;
      } else {
        content_package_id = row.attr('id').split('-').slice(-1)[0];
        link.attr('data-loaded', 0);
        setTimeout("Pig.Sitemap.loading(" + content_package_id + ")", 250);
        return $.get(row.data('children-url'), function() {
          link.attr('data-loaded', 1);
          // link.data('open', 1);
          link.attr('data-open', 1);
          link.find('i.sitemap-caret').removeClass('fa-spin').removeClass('fa-spinner').removeClass('fa-caret-right');
          if (e.originalEvent !== undefined)
            Pig.Sitemap.setCookie();
          return link.find('i.sitemap-caret').addClass('fa-caret-down');
        });
      }
    });
  },
  filter: function() {
    var status;
    status = $('select#status').val();
    if (status.length > 0) {
      $('h1').text("Content list - " + ($('select#status option:selected').text()));
      $("#sitemap tr.content-package").hide();
      return $("#sitemap tr.status-" + status).show();
    } else {
      $('h1').text('Content list');
      return $("#sitemap tr.content-package").show();
    }
  },
  loading: function(id) {
    var link;
    link = $("#content-package-" + id + " td.td-name");
    if (link.attr('data-loaded') === '0') {
      return link.find('i.sitemap-caret').removeClass('fa-caret-right').addClass('fa-spinner').addClass('fa-spin');
    }
  },
  getCookie: function() {
    var value = "; " + document.cookie;
    var parts = value.split("; " + "open" + "=");
    cookie = parts.length == 2 ? JSON.parse(parts.pop().split(";").shift()) : [];
    return cookie;
  },
  setCookie: function() {
    document.cookie = "open=" + JSON.stringify(Pig.Sitemap.getOpenNodes());
  },
  addToCookie: function(cp_id) {
    var cookie = Pig.Sitemap.getCookie();
    cookie.push(cp_id);
    document.cookie = "open=" + JSON.stringify(cookie);
  },
  getOpenNodes: function() {
    return $.map($('.td-name[data-open=1]'), function(a) {
      return $(a).data('content-package');
    });
  },
  setOpenNodes: function() {
    $.each(Pig.Sitemap.getCookie(), function(i, v) {
      $('.td-name[data-content-package="'+ v +'"]').each(function() {
        $(this).trigger('click');
      });
    });
  },
  openChildNodes: function(children_ids) {
    var cookie = Pig.Sitemap.getCookie();
    $.each(cookie, function(i, v){
      if (children_ids.indexOf(v) !== -1) {
        $('.td-name[data-content-package="'+ v +'"]').each(function() {
          $(this).trigger('click');
        });
      }
    });
  }
}
