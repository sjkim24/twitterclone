Twitter.Views.TweetIndex = Backbone.View.extend ({

  template: JST["tweets/index"],

  initialize: function (options) {
    this.tweets = options.tweets;
    this.listenTo(this.tweets, "sync", this.render);
  },

  render: function () {
    $(".errors").empty();
    console.log("render")
    var content = this.template({
      tweets: this.tweets
    });
    var tweet = new Twitter.Models.Tweet();
    this.$el.html(content);
    var tweetForm = new Twitter.Views.TweetForm ({
      model: tweet,
      collection: this.tweets
    });
    this.$(".tweetform").html(tweetForm.render().$el);

    return this;
  }

})
