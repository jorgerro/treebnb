Dashboard.Collections.UserListings = Backbone.Collection.extend({

  url: function () {
    return "/users/" + Dashboard.userId + "/rooms"
  },

  model: Dashboard.Models.Listing

});
