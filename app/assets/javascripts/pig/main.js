var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
$(document).ready(function() {
  var $select2;
  $('input,textarea,select').focusin(function() {
    return $(this).parents('.form-group').addClass('focus');
  });
  $('input,textarea,select').focusout(function() {
    return $(this).parents('.form-group').removeClass('focus');
  });
  $select2 = $('.select2');
  $select2.select2({
    tags: true
  });
  return $.ui.autocomplete.prototype._resizeMenu = function() {
    var ul;
    ul = this.menu.element;
    ul.outerWidth(this.element.outerWidth());
  };
});

window.YmAssets = {
  addDefaults: function(options, defaultOptions) {
    if (typeof options === 'object') {
      return $.extend(defaultOptions, options);
    } else {
      return defaultOptions;
    }
  },
  scrollTo: function(elem, options) {
    elem = $(elem);
    if (elem.length) {
      options = YmAssets.addDefaults(options, {
        offset: 0,
        duration: 750
      });
      return $('html, body').stop().animate({
        scrollTop: elem.position().top - options.offset
      }, options.duration);
    }
  },
  Tabs: {
    init: function() {
      var target_tab_link;
      if (window.location.hash) {
        target_tab_link = $(".nav-tabs li a[href='" + window.location.hash + "']").first();
        if (target_tab_link.length) {
          target_tab_link.tab('show');
        }
      }
      return $('.tab-pane').has('input.error, .control-group.error').each(__bind(function(idx, pane) {
        var link;
        link = $(".tabbable .nav a[href='#" + ($(pane).attr('id')) + "']");
        link.parent().addClass('error');
        if (idx === 0) {
          return link.tab('show');
        }
      }, this));
    }
  },
  Bootstrap: {
    init: function() {
      return $("[data-toggle='modal'][data-modal-url]").on('click', function() {
        var new_modal;
        $('.temp-modal').modal('hide');
        new_modal = $("<div class='modal temp-modal'></div>");
        if ($(this).data('modal-id') !== void 0) {
          new_modal.attr('id', $(this).data('modal-id'));
        }
        new_modal.modal({
          backdrop: $(this).data('backdrop')
        });
        new_modal.load($(this).data('modal-url'));
        return new_modal.on('hidden', function() {
          return $(this).remove();
        });
      });
    }
  },
  Forms: {
    initColorPickers: function() {
      return $('.colorpicker-control input').colorpicker().on('changeColor', function(colorpicker) {
        var colorDisplay;
        colorDisplay = $(this).parents('.colorpicker-control').find('.add-on i');
        return colorDisplay.css('background-color', colorpicker.color.toHex());
      });
    },
    initDatepickers: function() {
      $('input.datepicker').datepicker({
        dateFormat: 'dd/mm/yy'
      });
      $('input.datetime').datetimepicker({
        dateFormat: 'dd/mm/yy',
        timeFormat: 'hh:mm'
      });
      return $('input.timepicker').timepicker({
        timeFormat: 'hh:mm',
        stepMinute: 5
      });
    },
    LoadingText: {
      add: function(elem) {
        var btn, clickedBtn, loadingText, submitBtn, submitBtns;
        submitBtns = elem.find("input[type='submit']");
        submitBtns.addClass('disabled');
        clickedBtn = elem.find("input[type='submit'][data-clicked='true']");
        if (clickedBtn.length) {
          submitBtn = clickedBtn;
        } else {
          if (submitBtns.length > 1) {
            submitBtn = $(((function() {
              var _i, _len, _results;
              _results = [];
              for (_i = 0, _len = submitBtns.length; _i < _len; _i++) {
                btn = submitBtns[_i];
                if ($(btn).data('primary') === true) {
                  _results.push(btn);
                }
              }
              return _results;
            })())[0]);
          } else {
            submitBtn = $(submitBtns[0]);
          }
        }
        if (submitBtn != null) {
          loadingText = submitBtn.data("loading-text") || 'Saving...';
          return submitBtn.attr('data-non-loading-text', submitBtn.val()).val(loadingText);
        }
      },
      remove: function(elem) {
        var submitBtn;
        submitBtn = elem.find("input[type='submit']");
        return submitBtn.removeClass('disabled').val(submitBtn.data('non-loading-text'));
      },
      init: function() {
        $(".formtastic input[type='submit']").on("click", function(event) {
          return $(this).attr('data-clicked', true);
        });
        $(".formtastic:not('.loading-text-disabled')").on("submit", function() {
          return YmAssets.Forms.LoadingText.add($(this));
        });
        if (typeof ClientSideValidations !== 'undefined') {
          return ClientSideValidations.callbacks.form.fail = function(element, message, callback) {
            return YmAssets.Forms.LoadingText.remove(element);
          };
        }
      }
    },
    init: function() {
      YmAssets.Forms.LoadingText.init();
      YmAssets.Forms.initDatepickers();
      YmAssets.Forms.initColorPickers();
      return $('textarea:not(.redactor):not([data-dont-grow=true])').autogrow();
    }
  },
  Modals: {
    initAutoModal: function() {
      var new_href, res, search_params;
      $('#flash-modal').modal('show');
      if (res = window.location.search.match(/modal=(\w+)/)) {
        if ($("#" + res[1]).length) {
          $("#" + res[1]).modal('show');
          search_params = window.location.search.replace('?', '').split('&');
          search_params.splice($.inArray("modal=" + res[1], search_params), 1);
          if (search_params.length > 0) {
            search_params = "?" + (search_params.join('&'));
          } else {
            search_params = "";
          }
          new_href = "" + window.location.origin + window.location.pathname + search_params;
          if (history.pushState !== void 0) {
            return history.pushState({
              path: this.path
            }, '', new_href);
          }
        }
      }
    }
  },
  ReadMoreTruncate: {
    init: function() {
      return $('.read-more-link').on('click', function(event) {
        var wrapper;
        event.preventDefault();
        wrapper = $(this).parents('.read-more-wrapper:first');
        wrapper.children('.read-more-trunc').hide();
        return wrapper.children('.read-more-full').show();
      });
    }
  },
  init: function() {
    YmAssets.Tabs.init();
    YmAssets.Bootstrap.init();
    YmAssets.Forms.init();
    YmAssets.Modals.initAutoModal();
    return YmAssets.ReadMoreTruncate.init();
  }
};
$(document).ready(function() {
  return YmAssets.init();
});
