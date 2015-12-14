Twitter.Views.UserShow = Backbone.View.extend ({

  template: JST["users/show"],
  events: {
    "click .delete-tweet": "deleteTweet",
    "click .follow": "followUser",
    "click .unfollow": "unfollowUser"
  },

  initialize: function (options) {
    this.users = options.users;
    this.tweets = options.tweets;
    this.follows = options.follows;
    this.listenTo(this.model, "sync", this.render);
  },

  currentUserCheck: function () {
    return parseInt(this.model.id) === Twitter.CurrentUser.id;
  },

  followUser: function (event) {
    event.preventDefault;
    var follow = new Twitter.Models.Follow({
      "follower_id": Twitter.CurrentUser.id,
      "user_id": this.model.id
    });
    var that = this;
    follow.save( {}, {
      success: function () {
        that.follows.add(follow, { merge: true });
        Backbone.history.loadUrl(Backbone.history.fragment);
      }
    });
  },

  unfollowUser: function (event) {
    event.preventDefault;
    var follow = this.follows.findWhere({
      "follower_id": Twitter.CurrentUser.id,
      "user_id": this.model.id
    });
    follow.destroy({
      success: function () {
        Backbone.history.loadUrl(Backbone.history.fragment);
      }
    });
  },

  render: function () {
    $(".errors").empty();
    var content = this.template({
      user: this.model,
      currentUserCheck: this.currentUserCheck()
    });
    var tweet = new Twitter.Models.Tweet();
    this.$el.html(content);
    if (this.currentUserCheck()) {
      var tweetForm = new Twitter.Views.TweetForm ({
        model: tweet,
        collection: this.tweets
      });
      this.$(".tweetform").append(tweetForm.render().$el);
    }

    return this;
  },

  deleteTweet: function (event) {
    event.preventDefault();
    var id = parseInt(event.currentTarget.id);
    var tweet = this.tweets.get(id)
    tweet.destroy({
      success: function () {
        Backbone.history.loadUrl(Backbone.history.fragment);
      }
    });
  }

});
