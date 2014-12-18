(function() {
  var _;

  _ = (typeof module !== "undefined" && module !== null ? module.exports : void 0) != null ? require('lodash') : window._;

  _.mixin({
    uuid: function() {
      var now;
      now = Date.now();
      return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r;
        r = (now + Math.random() * 16) % 16 | 0;
        now = Math.floor(now / 16);
        return (c === "x" ? r : r & 0x7 | 0x8).toString(16);
      });
    }
  });

}).call(this);
