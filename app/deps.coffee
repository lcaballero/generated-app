nject = require('nject')
Tree  = nject.Tree


module.exports = do ->

  require './public/js/LodashMixins'

  tree = new Tree()

  tree.register('express'           , -> require("express"))

  tree.register('HomeController'    , require("./controllers/HomeController"))
  tree.register('LoginController'   , require("./controllers/LoginController"))

  tree.register('User'              , require("./models/User"))

  tree.register('socket'            , require('./middleware/socket'))
  tree.register('routes'            , require('./middleware/routes'))
  tree.register('app'               , require('./middleware/app'))
  tree.register('session'           , require('./middleware/session'))
  tree.register('views'             , require('./middleware/views'))
  tree.register('setup'             , require('./middleware/setup'))

  tree.register('mongo'             , require('./repos/Mongo'))
  tree.register('logger'            , require('./logger'))

  tree.constant('config'            , require('../config/default.json'))
