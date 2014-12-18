(function() {
  (function() {
    var id, socket;
    socket = io.connect('http://localhost:3000');
    socket.on('news', function(data) {
      return console.log(data);
    });
    id = 0;
    setInterval(function() {
      return socket.emit('request', {
        id: ++id
      });
    }, 300);
    return socket.on('response', function(data) {
      return console.log('response ==>', data, data.id, data.n, true);
    });
  })();

}).call(this);
