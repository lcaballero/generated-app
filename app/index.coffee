module.exports = do ->
  require('./deps').resolve((err, resolved) ->
    if err?
      console.log('Failed to resolve DI tree.', err)
    else
      { app, config } = resolved
      { port } = config
      app.listen(port, ->
        console.log('Listening on port %d', port)
      )
  )
