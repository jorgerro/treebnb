Dashboard.Views.TripsIndex = Backbone.View.extend({

  template: JST['trips/index'],

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      trips: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }

});
