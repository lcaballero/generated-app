nject = require('nject')
Tree  = nject.Tree


module.exports = do ->

  console.log('Setting up dependency tree.')

  require './public/src/js/LodashMixins'

  tree = new Tree()

  tree.on('info', (data) -> console.log('info:', data))
  tree.on('debug', (data) -> console.log('debug:', data))
  tree.on('warn', (data) -> console.log('warn:', data))

  tree.register('HomeController'    , require("./controllers/HomeController"))
  tree.register('LoginController'   , require("./controllers/LoginController"))

  tree.register('User'              , require("./models/User"))

  tree.register('app'               , require('./middleware/app'))
  tree.register('routes'            , require('./middleware/routes'))
  tree.register('session'           , require('./middleware/session'))
  tree.register('socket'            , require('./middleware/socket'))
  tree.register('views'             , require('./middleware/views'))

  tree.register('mongo'             , require('./repos/Mongo'))
  tree.register('logger'            , require('./logger'))

  tree.constant('express'           , require('express'))
  tree.constant('config'            , require('../config/default.json'))
  tree.constant('SocketIO'          , require('socket.io'))

  tree