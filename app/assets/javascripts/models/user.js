Twitter.Models.User = Backbone.Model.extend ({

  urlRoot: "/api/users",

  parse: function (response) {
    var user = this;

    if (response.tweets) {
      user.tweets().set(response.tweets);
      delete response.tweets;
    }

    if (response.followers) {
      user.followers().set(response.followers);
      delete response.followers;
    }

    if (response.followings) {
      user.followings().set(response.followings);
      delete response.followings;
    }

    return response;
  },

  tweets: function () {
    if (!this._tweets) {
      this._tweets = new Twitter.Collections.Tweets( [], { user: this });
    }

    return this._tweets;
  },

  followers: function () {
    if (!this._followers) {
      this._followers = new Twitter.Collections.Follows( [], { user: this });
    }

    return this._followers;
  },

  followings: function () {
    if (!this._followings) {
      this._followings = new Twitter.Collections.Follows( [], { user: this });
    }

    return this._followings;
  },

  toJSON: function () {
    return { user: _.clone(this.attributes) };
  }

});
