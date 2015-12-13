Twitter.Models.Follow = Backbone.Model.extend ({

  urlRoot: "/api/follows",

  toJSON: function () {
    return { follow: _.clone(this.attributes) };
  }

});
