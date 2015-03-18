$(function() {
  $(".favorite-buses-table button").click(function(e) {
    e.preventDefault();
    var $this = $(this);
    console.log( $this.data('id'), $this.data('action') );

    var $that = $this;
    if ($this.data('action') === 'favorite') {
      $.ajax("/buses/" + $this.data('id') + "/favorite", {
        method: "POST",
        success: function() {
          $that.removeClass("btn-default").addClass("btn-danger").html("<i class='glyphicon glyphicon-remove'></i>");
        },
        error: function() { alert("Oops ..."); }
      });

    } else {
      $.ajax("/buses/" + $this.data('id') + "/unfavorite", {
        method: "DELETE",
        success: function() {
          $that.removeClass("btn-danger").addClass("btn-default").html("<i class='glyphicon glyphicon-star'></i>");
        },
        error: function() { alert("Oops ..."); }
      });

    }
  });
});
