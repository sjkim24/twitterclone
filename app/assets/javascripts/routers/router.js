Twitter.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.users = new Twitter.Collections.Users ();
  },

  routes: {
    'users/:id': 'userShow'
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id);
    var showView = new Twitter.Views.UserShow ({
      model: user
    });

    this._swapView(showView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

})
