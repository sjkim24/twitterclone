window.Twitter = {

  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function () {
    new Twitter.Routers.Router ({
      $rootEl: $('#main')
    });
    Backbone.history.start();
  }
};

$(document).ready(function() {
  Twitter.initialize();
});
