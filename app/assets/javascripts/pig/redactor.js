Pig.Redactor = {
  init: function() {
   $('.redactor textarea').redactor({
      removeClasses: true,
      removeStyles: true,
      buttons: ['unorderedlist', 'orderedlist', 'link', 'html'],
      convertDivs: true,
      path: 'vendor/assets/javascripts/redactor',
      plugins: $('.redactor textarea').data('redactor-plugins'),
      tabKey: false,
      focusCallback: function(e) {
        return $(e.currentTarget).parents(".form-group").addClass("focus");
      },
      blurCallback: function(e) {
        return $(e.currentTarget).parents(".form-group").removeClass("focus");
      },
      initCallback: function(e) {
        if (CharacterLimits && this.$element.data('limit-quantity')) {
          return CharacterLimits.registerRedactor(this);
        }
      },
      changeCallback: function(e) {
        if (CharacterLimits && this.$element.data('limit-quantity')) {
          return CharacterLimits.redactorChanged(this);
        }
      }
    });

    $('.rich_redactor textarea').redactor({
      buttons: ['html', 'formatting', 'bold', 'italic', 'unorderedlist', 'orderedlist', 'image', 'link'],
      plugins: $('.rich_redactor textarea').data('redactor-plugins'),
      path: 'vendor/assets/javascripts/redactor',
      imageUpload: PigConfig.namespace + '/redactor_image_uploads?file_type=image',
      imageGetJson: PigConfig.namespace + '/redactor_image_uploads',
      formatting: ['p', 'h1', 'h2', 'h3', 'h4', 'h5'],
      imageResizable: false,
      imagePosition: true,
      tabKey: false,
      cleanStyleOnEnter: true,
      focusCallback: function(e) {
        return $(e.currentTarget).parents(".form-group").addClass("focus");
      },
      blurCallback: function(e) {
        return $(e.currentTarget).parents(".form-group").removeClass("focus");
      },
      initCallback: function(e) {
        redactorPluginUpdates.update();
      },
      changeCallback: function(e) {
        redactorPluginUpdates.update('change');
      }
    });
  }
}
