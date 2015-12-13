Twitter.Views.UserShow = Backbone.View.extend ({

  template: JST["users/show"],
  events: {
    "click .delete-tweet": "deleteTweet",
    "click .follow": "followOrUnfollow"
  },


  initialize: function (options) {
    this.tweets = options.tweets;
    this.listenTo(this.model, "sync", this.render);
  },

  currentUserCheck: function () {
    return parseInt(this.model.id) === Twitter.CurrentUser.id;
  },

  followOrUnfollow: function (event) {
    event.preventDefault;

  },

  render: function () {
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
