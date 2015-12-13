Twitter.Views.UserShow = Backbone.View.extend ({

  template: JST["users/show"],
  events: {"click .delete-tweet": "deleteTweet" },

  initialize: function (options) {
    this.tweets = options.tweets;
    this.listenTo(this.model, "sync", this.render);
  },

  currentUserId: function () {
    return Twitter.CurrentUser.id;
  },

  render: function () {
    var content = this.template({ user: this.model });
    var tweet = new Twitter.Models.Tweet();
    this.$el.html(content);
    if (this.currentUserId() === this.model.id) {
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
