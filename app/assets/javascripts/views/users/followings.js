Twitter.Views.UserFollowings = Backbone.View.extend ({

  template: JST["users/followings"],

  initialize: function (options) {
    this.user = options.user;
    this.users = options.users;
    this.getFollowings()
  },

  getFollowings: function () {
    var followings = [];
    var that = this;
    this.user.followings().forEach(function(following) {
      followings.push(that.users.getOrFetch(following.get("follower_id")));
    });
    return followings;
  },

  render: function () {
    this.getFollowings()
    var content = this.template({
      user: this.user,
      followings: this.getFollowings()
    });
    this.$el.html(content);

    return this;
  }

});
