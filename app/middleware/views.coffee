path = require 'path'


module.exports = (app, express, logger) ->

  paths =
    views     : path.join(__dirname, '../views')
    public    : path.join(__dirname, '../public')
    layouts   : path.join(__dirname, '../views/layouts')
    partials  : path.join(__dirname, '../views/partials')

  logger.debug("Setting app 'views' to #{paths.views}")
  logger.debug("Setting app 'public' to #{paths.public}")
  logger.debug("Setting app 'layouts' to #{paths.layouts}")
  logger.debug("Setting app 'partials' to #{paths.partials}")

  app.set('views' , paths.views)
  app.set('public', paths.public)

  app.set 'view engine', 'jade'

  # This can/should be handled by something like Nginx
  app.use express.static(paths.public)
