Twitter.Views.UserFollowers = Backbone.View.extend ({

  template: JST["users/followers"],

  initialize: function (options) {
    this.user = options.user;
    this.users = options.users;
  },

  getFollowers: function () {
    var followers = [];
    var that = this;
    this.user.followers().forEach(function(follower) {
      followers.push(that.users.getOrFetch(follower.get("user_id")));
    });

    return followers;
  },

  render: function () {
    var content = this.template({
      user: this.user,
      followers: this.getFollowers()
    });
    this.$el.html(content);

    return this;
  }

})
