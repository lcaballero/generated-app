socket        = require 'socket.io'
http          = require 'http'


module.exports = (app, logger) ->

  server = http.createServer(app)

  io = socket.listen(server)

  io.sockets.on('connection', (socket) ->
    logger.debug("Connected to socket.io")

    socket.on('request', (data) ->
      console.log("recieved data", data)
      socket.emit('response', { id: data.id, n : data.id * 2 })
    )
  )

  server