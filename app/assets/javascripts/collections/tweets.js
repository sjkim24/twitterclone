Twitter.Collections.Tweets = Backbone.Collection.extend ({

  url: '/api/tweets',
  model: Twitter.Models.Tweet

});
