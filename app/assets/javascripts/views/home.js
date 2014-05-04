Dashboard.Views.HomeView = Backbone.View.extend({

  template: JST["home"],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }

})