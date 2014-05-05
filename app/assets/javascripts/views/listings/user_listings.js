Dashboard.Views.UserListings = Backbone.View.extend({

  template: JST['listings/index'],

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      listings: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }

});
