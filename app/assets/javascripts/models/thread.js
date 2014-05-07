Dashboard.Models.Thread = Backbone.Model.extend({

  initialize: function () {
    this.messages();
  },

  parse: function (resp) {
    if (resp.messages) {
      this.messages().set(resp.messages, { parse: true });
      // this.messages = new Dashboard.Collections.Messages(response["messages"], { parse: true });
      delete resp.messages;
    }
    return resp;
  },

  messages: function () {
    if (!this._messages) {
      this._messages = new Dashboard.Collections.Messages([], {
        thread: this
      });
    }
    return this._messages;
  }

});