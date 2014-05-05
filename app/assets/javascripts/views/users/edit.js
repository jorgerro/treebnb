Dashboard.Views.UserEdit = Backbone.View.extend({

  template: JST['users/edit'],

  events: {
    "submit form": "submit"
  },

  render: function () {
    this.$el.html("");
    var renderedContent = this.template({
      user: this.model,
      id: Dashboard.userId
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON();
    this.model.save(formData, {
      success: function () {
        alert("Your profile has been updated!");
        Backbone.history.navigate("#/")
      },
      error: function () {
        alert("Could not save your form")
      }
    });
  },


});
