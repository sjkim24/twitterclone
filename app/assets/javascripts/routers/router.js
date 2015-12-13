Twitter.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.users = new Twitter.Collections.Users();
    this.tweets = new Twitter.Collections.Tweets();
    this.follows = new Twitter.Collections.Follows();
  },

  routes: {
    "": "tweetsIndex",
    "users/:id": "userShow"
  },

  tweetsIndex: function () {
    this.tweets.fetch();
    var indexView = new Twitter.Views.TweetIndex ();
    this.$rootEl.html(indexView.render().$el);
  },

  userShow: function(id) {
    this.tweets.fetch();
    this.follows.fetch();
    var user = this.users.getOrFetch(id);
    var view = new Twitter.Views.UserShow ({
      model: user,
      tweets: this.tweets,
      follows: this.follows
    });
    this.$rootEl.html(view.render().$el);
  }

});
