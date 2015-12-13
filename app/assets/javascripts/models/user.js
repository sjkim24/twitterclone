Twitter.Models.User = Backbone.Model.extend ({

  urlRoot: "/api/users",

  parse: function (response) {
    var user = this;
    if (response.tweets) {
      user.tweets().set(response.tweets);
      delete response.tweets;
    }

    return response;
  },

  tweets: function () {
    if (!this._tweets) {
      this._tweets = new Twitter.Collections.Tweets( [], { user: this });
    }

    return this._tweets;
  },

  toJSON: function () {
    return { user: _.clone(this.attributes) };
  }

});
