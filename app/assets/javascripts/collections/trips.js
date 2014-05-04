Dashboard.Collections.Trips = Backbone.Collection.extend({

  url: function () {
    return "/users/" + Dashboard.userId + "/room_requests"
  },

  model: Dashboard.Models.Trip

});
