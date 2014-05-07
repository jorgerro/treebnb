Dashboard.Models.Thread = Backbone.Model.extend({

  initialize: function () {
  },

  parse: function (response) {
    if (response["messages"]) {
      this.messages = new Dashboard.Collections.Messages(response["messages"], { parse: true });
      delete response["messages"];
    }
    return response;
  },

  // messages: function () {
  //   if (!this.get("messages")) {
  //     var messages = new Dashboard.Collections.Messages([], {
  //       thread: this
  //     });
  //     this.set({
  //       messages: messages
  //     });
  //   }
  //   return this.get('messages');
  // }

});