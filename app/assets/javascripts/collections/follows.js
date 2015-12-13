Twitter.Collections.Follows = Backbone.Collection.extend ({

  url: "/api/follows",
  model: Twitter.Models.Follow

});
