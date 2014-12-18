http          = require 'http'
socket        = require 'socket.io'

module.exports = (app, logger) ->
  io = socket(http.createServer(app))

  io.on('connection', ->
    logger.debug("Connected to socket.io")

    setInterval(->
      io.on('request', (data) ->
        console.log(JSON.stringify(data))
      )
    , 300)
  )