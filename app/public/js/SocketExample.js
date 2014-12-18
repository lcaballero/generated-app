;(function() {
  var socket = io.connect('http://localhost:3000')

  socket.on('news', function(data) {
    console.log(data);
  });

  var id = 0;

  setInterval(function() {
    socket.emit('request', {
      id: ++id
    });
  }, 300);

  socket.on('response', function(data) {
    console.log('response', data)
  })

})();