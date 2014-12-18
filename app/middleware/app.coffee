cookieParser  = require 'cookie-parser'
cookieSession = require 'cookie-session'
favicon       = require 'serve-favicon'
passport      = require 'passport'
bodyParser    = require 'body-parser'
path          = require 'path'


module.exports = (config, logger, express) ->

  console.log("app.coffee")

  logger.debug("App created from #{__filename}")

  app = express()

  icon = path.join(__dirname, '../public/favicon.ico')

  logger.debug("Using favicon: #{icon}")

  app.use favicon(icon)
  app.use cookieSession({
    keys    : [ 'views', 'sid' ]
    signed  : true
  })
  app.use bodyParser.json()
  app.use bodyParser.urlencoded({ extended: false })
  app.use cookieParser('do not ask, do not tell')
  app.use passport.initialize()
  app.use passport.session()

  app