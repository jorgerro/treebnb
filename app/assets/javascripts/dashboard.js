window.Dashboard = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function(allthreads) {

    Dashboard.userId = currentUserId
    Dashboard.threads = JSON.parse($("#bootstrapped-threads").html())

    new Dashboard.Routers.DashboardRouter({
      $rootEl: $("#content")
    });

    Backbone.history.start();
  }

};
