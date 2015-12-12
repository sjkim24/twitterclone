Twitter.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.users = new Twitter.Collections.Users ();
  },

  routes: {
    '': 'tweetsIndex',
    'users/:id': 'userShow'
  },

  tweetsIndex: function () {
    var indexView = new Twitter.Views.TweetIndex ();
    this.$rootEl.html(indexView.render().$el);
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id);
    var showView = new Twitter.Views.UserShow ({
      model: user
    });

    this.$rootEl.html(showView.render().$el);
  }

});
