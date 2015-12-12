window.Twitter = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    alert("backbone initialized")
    new Twitter.Routers.Router ({
      $rootEl: $('#main')
    });
    Backbone.history.start();
  }
};

$(document).ready(function() {
  Twitter.initialize();
});
