Dashboard.Views.TripsIndex = Backbone.View.extend({

  template: JST['trips/index'],

  events: {
    "submit form": "submit"
  },

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      trips: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    if ( confirm("Are you sure you want to cancel this trip?") ) {
      $form = $(event.currentTarget)
      formData = $form.serializeJSON();
      $.ajax({
        url: $form.attr("action"),
        data: formData,
        type: "POST",
        success: function () {
          Backbone.history.navigate("#/trips")
        }
      })
    }


  }

});
