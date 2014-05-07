Dashboard.Views.Threads = Backbone.View.extend({

  template: JST["threads/index"],

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      threads: this.collection
    })
    this.$el.html(renderedContent);
    return this;
  }

});