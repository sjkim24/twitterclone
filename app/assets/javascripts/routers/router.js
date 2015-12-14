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
    var indexView = new Twitter.Views.TweetIndex ();
    this.$rootEl.html(indexView.render().$el);
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
    this.$rootEl.html(view.render().$el);
  },

  userFollowers: function (id) {
    this.users.fetch();
    var user = this.users.getOrFetch(id);
    var view = new Twitter.Views.UserFollowers ({
      user: user,
      users: this.users
    });
    this.$rootEl.html(view.render().$el);
  },

  userFollowings: function (id) {
    this.users.fetch();
    var user = this.users.getOrFetch(id);
    var view = new Twitter.Views.UserFollowings ({
      user: user,
      users: this.users
    });
    this.$rootEl.html(view.render().$el);
  }

});
