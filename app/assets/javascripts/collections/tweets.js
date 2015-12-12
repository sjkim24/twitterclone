Twitter.Collections.Tweets = Backbone.Collection.extend ({
  url: '/api/tweets',
  model: Twitter.Models.Tweet,

  getOrFetch: function (id) {
    var tweet = this.get(id);
    var tweets = this;
    if (tweet) {
      tweet.fetch();
    } else {
      tweet = new Twitter.Models.Tweet ({ id: id });
      tweet.fetch({
        success: function () {
          tweets.add(tweet)
        }
      });
    }

    return tweet;
  }
});
