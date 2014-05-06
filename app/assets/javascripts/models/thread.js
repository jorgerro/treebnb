Dashboard.Models.Thread = Backbone.Model.extend({

  initialize: function () {
    this.messages();
  },


  parse: function (response) {
    if (response["messages"]) {
      this.messages().set(response["messages"], { parse: true });
      delete response["messages"];
    }
    return response;
  },

  messages: function () {
    if (!this.get("messages")) {
      var messages = new Dashboard.Collections.Messages([], {
        thread: this
      });
      this.set({
        messages: messaages
      });
    }
    return this.get('messages');
  }

});