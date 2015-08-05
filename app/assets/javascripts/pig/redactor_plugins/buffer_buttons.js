/*
 * To include in a project add 'bufferbuttons' to config.redactor_plugins in config/initializers/pig.rb
 */

if (!RedactorPlugins) var RedactorPlugins = {};

(function($) {
  RedactorPlugins.bufferbuttons = function() {
    return {
      init: function() {
        var undo = this.button.addFirst('undo', 'Undo');
        var redo = this.button.addAfter('undo', 'redo', 'Redo');

        this.button.addCallback(undo, this.buffer.undo);
        this.button.addCallback(redo, this.buffer.redo);
      }
    };
  };
})(jQuery);
