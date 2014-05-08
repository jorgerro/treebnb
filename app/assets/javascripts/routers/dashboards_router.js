Dashboard.Routers.DashboardRouter = Backbone.Router.extend({

  routes: {
    "": "start",
    "trips": "trips",
    "profile": "profile",
    "listings": "listings",
    "inbox": "inbox"
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  start: function () {
    var homeView = new Dashboard.Views.HomeView();
    this.swapView(homeView);
  },

  trips: function () {
    // fetch trips
    var that = this
    var trips = new Dashboard.Collections.Trips();
    trips.fetch({
      success: function () {
        var tripsIndexView = new Dashboard.Views.TripsIndex({
          collection: trips
        });
        that.swapView(tripsIndexView);
      }
    });
  },

  profile: function () {
    var that = this;
    var user = new Dashboard.Models.User({ id: Dashboard.userId });
    user.fetch({
      success: function () {
        var userEditView = new Dashboard.Views.UserEdit({
          model: user
        });
        that.swapView(userEditView);
      }
    });
  },

  listings: function () {
    var that = this;
    var listings = new Dashboard.Collections.UserListings();
    listings.fetch({
      success: function () {
        var userListingsView = new Dashboard.Views.UserListings({
          collection: listings
        });
        that.swapView(userListingsView);
      }
    });
  },

  inbox: function () {
    // console.log(threads)
    // console.log(threads.get(1).messages());

    // var threadsView = new Dashboard.Views.Threads({
    //   collection: Dashboard.threads
    // })
    // this.swapView(threadsView);

    var messagesView = new Dashboard.Views.Messages({
      collection: Dashboard.messages
    })
    this.swapView(messagesView);

  },

  swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view
    this.$rootEl.html(view.render().$el)
  }

});

