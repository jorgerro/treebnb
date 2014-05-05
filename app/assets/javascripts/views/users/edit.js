Dashboard.Views.UserEdit = Backbone.View.extend({

  template: JST['users/edit'],

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      user: this.model,
      id: Dashboard.userId
    });
    this.$el.html(renderedContent);
    return this;
  }

});
