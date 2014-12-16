module.exports = (logger, express) ->

  app = express()

  logger.debug("App created from #{__filename}")

  app
