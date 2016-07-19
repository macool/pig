Pig.ContentPackage = (function() {  
  var goalChangedByUser = false;

  updateGoal = function(descriptions) {
    if (!goalChangedByUser) {
      var goal = descriptions[$('#content_package_content_type_id').val()];
      return $('#content_package_notes').val(goal);
    }
  } 

  init = function(descriptions) {
    // update content goal field with default for selected content type
    $('#content_package_content_type_id').change(function() {
      return updateGoal(descriptions);
    });
    // ensure changing the template after user has edited the goal does not
    // overwrite their data
    $('#content_package_notes').change(function() {
      goalChangedByUser = true;
    });
    return updateGoal(descriptions);
  }

  return { init: init }; 
})();
