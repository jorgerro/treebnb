window.Dashboard = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {

    Dashboard.userId = currentUserId

    new Dashboard.Routers.DashboardRouter({
      $rootEl: $("#content")
    });

    Backbone.history.start();
  }

};
