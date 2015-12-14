Twitter.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.users = new Twitter.Collections.Users();
    this.tweets = new Twitter.Collections.Tweets();
    this.follows = new Twitter.Collections.Follows();
  },

  routes: {
    "": "tweetsIndex",
    "users/:id": "userShow",
    "users/:id/followers": "userFollowers",
    "users/:id/followings": "userFollowings"
  },

  tweetsIndex: function () {
    this.tweets.fetch();
    var view = new Twitter.Views.TweetIndex ({
      tweets: this.tweets
    });
    this._swapView(view);
  },

  userShow: function (id) {
    this.users.fetch();
    this.tweets.fetch();
    this.follows.fetch();
    var user = this.users.getOrFetch(id);
    var view = new Twitter.Views.UserShow ({
      model: user,
      users: this.users,
      tweets: this.tweets,
      follows: this.follows
    });
    this._swapView(view);
  },

  userFollowers: function (id) {
    this.users.fetch();
    var user = this.users.getOrFetch(id);
    var view = new Twitter.Views.UserFollowers ({
      user: user,
      users: this.users
    });
    this._swapView(view);
  },

  userFollowings: function (id) {
    this.users.fetch();
    var user = this.users.getOrFetch(id);
    var view = new Twitter.Views.UserFollowings ({
      user: user,
      users: this.users
    });
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
