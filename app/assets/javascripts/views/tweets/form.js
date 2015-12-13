Twitter.Views.TweetForm = Backbone.View.extend ({

  tagName: "form",
  template: JST["tweets/form"],
  events: { "click .submit-tweet": "submitTweet" },

  initialize: function (options) {
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  submitTweet: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON().tweet;
    this.model.set(attrs);
    this.model.save( {}, {
      success: function () {
        alert("SUCCESS")
        // that.collection.add(that.model, { merge: true });
        // Backbone.history.navigate("users/" +)
      },

      error: function (model, response) {
        alert("error")
        // $(".errors").empty();
        // response.responseJSON.forEach(function(el) {
        //   var li = $("<li></li>");
        //   li.html(el);
        //   $(".errors").append(li);
        // }.bind(this));
      }
    });
  }

});
