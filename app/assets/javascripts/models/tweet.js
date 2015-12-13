Twitter.Models.Tweet = Backbone.Model.extend({

  urlRoot: "/api/tweets",

  toJSON: function () {
    return { tweet: _.clone(this.attributes) };
  }

})
