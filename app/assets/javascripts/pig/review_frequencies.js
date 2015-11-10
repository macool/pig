window.reviewFrequencies = (function() {

  $(function() {
    $("[data-review-preset]").on("click", function(e) {
      e.preventDefault();
      $("#content_package_next_review").datepicker('setDate', new Date($(e.currentTarget).data("review-preset")));
    });
  });

})();
