window.Twitter = {

  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function () {
    Twitter.CurrentUser = new Twitter.Models.CurrentUser();
    Twitter.CurrentUser.fetch({
      success: function () {
        new Twitter.Routers.Router ({
          $rootEl: $('#main')
        });
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function() {
  Twitter.initialize();
});
