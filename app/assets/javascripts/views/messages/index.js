Dashboard.Views.Messages = Backbone.View.extend({

  template: JST["messages/index"],

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      messages: this.collection
    })
    this.$el.html(renderedContent);
    return this;
  }

});