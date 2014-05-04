Dashboard.Routers.DashboardRouter = Backbone.Router.extend({

  routes: {
    "": "start",
    "trips": "trips"
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  start: function () {
    console.log(this.$rootEl)
  },

  trips: function () {

    alert('in the trips')



  },

  swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view
    this.$rootEl.html(view.render().$el)
  }

});


// <a href="/">Dashboard</a>
// <a href="/inbox">Inbox</a>
// <a href="/trips">Trips</a>
// <a href="/listings">Listings</a>
// <a href="/profile">Profile</a>
