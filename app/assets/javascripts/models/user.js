Dashboard.Models.User = Backbone.Model.extend({

  url: function () {
    return "/users/" + Dashboard.userId
  }


});
