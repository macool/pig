var formSubmitting = false;

function setFormSubmitting() {
  formSubmitting = true;
}

$(document).ready(function(){
  if ($('.unsaved-changes').length > 0) {
    window.onload = function() {
      window.addEventListener("beforeunload", function (e) {
        var confirmationMessage = 'It looks like you have been editing something. ';
        confirmationMessage += 'If you leave before saving, your changes will be lost.';
        if (formSubmitting) {
          return undefined;
        }
        (e || window.event).returnValue = confirmationMessage; //Gecko + IE
        return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
      });
    };
  }
});
