;(function() {
  var socket = io.connect('http://localhost:3000')

  socket.on('news', function(data) {
    console.log(data);
  });

  setInterval(function() {
    socket.emit('request', {
      id: ++id
    });
  }, 300);

})();