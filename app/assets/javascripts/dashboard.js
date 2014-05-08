window.Dashboard = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function(allthreads) {

    Dashboard.userId = currentUserId
    // parsedThreads = JSON.parse($("#bootstrapped-threads").html())
    // Dashboard.threads = new Dashboard.Collections.Threads(parsedThreads, { parse: true });

    parsedMessages = JSON.parse($("#bootstrapped-threads").html())
    Dashboard.messages = new Dashboard.Collections.Messages(parsedMessages, { parse: true });

    new Dashboard.Routers.DashboardRouter({
      $rootEl: $("#content")
    });

    Backbone.history.start();
  }

};
