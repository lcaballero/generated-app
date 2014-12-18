do ->
  socket = io.connect('http://localhost:3000')

  socket.on('news', (data) ->
    console.log(data)
  )

  id = 0

  setInterval(->
    socket.emit('request', { id: ++id })
  , 300)

  socket.on('response', (data) ->
    console.log('response ==>', data, data.id, data.n, true)
  )

