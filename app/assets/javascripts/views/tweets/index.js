Twitter.Views.TweetIndex = Backbone.View.extend ({

  template: JST["tweets/index"],

  initialize: function () {

  },

  render: function () {

    var content = this.template();
    this.$el.html(content);

    return this;
  }

})
