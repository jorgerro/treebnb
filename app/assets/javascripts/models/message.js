Dashboard.Models.Message = Backbone.Model.extend({

  initialize: function () {
    this.sender();
  },

  parse: function (resp) {
    if (resp.sender) {
      this.sender().set(resp.sender, { parse: true });
      delete resp.sender;
    }
    return resp;
  },

  sender: function () {
    if (!this._sender) {
      this._sender = new Dashboard.Models.User({}, {
        message: this
      });
    }
    return this._sender;
  }


});