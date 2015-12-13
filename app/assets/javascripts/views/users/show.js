Twitter.Views.UserShow = Backbone.View.extend ({

  template: JST["users/show"],

  initialize: function (options) {
    this.tweets = options.tweets;
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({ user: this.model });
    var tweet = new Twitter.Models.Tweet();
    var tweetForm = new Twitter.Views.TweetForm ({
      model: tweet,
      collection: this.tweets
    });
    this.$el.html(content);
    this.$(".tweetform").append(tweetForm.render().$el);

    return this;
  }

});
