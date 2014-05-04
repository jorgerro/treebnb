window.Dashboard = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {

    this.userId = currentUserId
    var options = {
      $rootEl: $("#content")
    }
    new Dashboard.Routers.DashboardRouter(options);

    Backbone.history.start();
  }

};
