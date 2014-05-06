Dashboard.Collections.Threads = Backbone.Collection.extend({

  url: function () {
    return "/users/" + Dashboard.userId + "/message_threads"
  }


})