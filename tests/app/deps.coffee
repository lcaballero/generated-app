nject = require 'nject'
{ Tree } = nject


module.exports = ->
  tree = new Tree()
  tree.register('mongo'     , require('../../app/repos/Mongo'))
  tree.register("User"      , require('../../app/models/User'))
  tree.constant('config'    , require('../../config/default.json'))


