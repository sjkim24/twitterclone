Twitter.Views.TweetForm = Backbone.View.extend ({

  tagName: "form",
  template: JST["tweets/form"],
  events: { "click .submit-tweet": "submitTweet" },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submitTweet: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON().tweet;
    this.model.set(attrs);
    var that = this;
    this.model.save( {}, {
      success: function () {
        that.collection.add(that.model, { merge: true });
        Backbone.history.loadUrl(Backbone.history.fragment);
      },

      error: function (model, response) {
        $(".errors").empty();
        response.responseJSON.forEach(function(error) {
          var li = $("<li></li>");
          li.html(error);
          $(".errors").append(li);
        });
      }

    });
  }

});
