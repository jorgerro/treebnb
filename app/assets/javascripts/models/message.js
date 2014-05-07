Dashboard.Models.Message = Backbone.Model.extend({

  initialize: function () {
  },

  parse: function (response) {
    if (response["sender"]) {
      this.sender = new Dashboard.Models.User(response["sender"], { parse: true });
      delete response["sender"];
    }
    return response;
  },

  // sender: function () {
  //   if (!this.get("sender")) {
  //     var sender = new Dashboard.Models.User({}, {
  //       message: this
  //     });
  //     this.set({
  //       sender: sender
  //     });
  //   }
  //   return this.get('sender');
  // }


});