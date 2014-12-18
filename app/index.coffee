module.exports = do ->
  require('./deps').resolve((err, resolved) ->
    if err?
      console.log('Failed to resolve DI tree.', err)
    else
      { logger, socket, config } = resolved
      logger.info("Application started: ", new Date())
      socket.listen(config.port, ->
        logger.info("Express listening on port: #{config.port}")
      )
  )
