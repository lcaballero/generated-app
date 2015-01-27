mongodb = require 'mongodb'
client  = mongodb.MongoClient


module.exports = (config, _done) ->

  tree = @
  mongo = config.mongo

  # Using ip resolves faster than DNS lookup which could cause Nject timeouts.
  url = "mongodb://#{mongo.host || 'localhost'}:#{mongo.port}/#{mongo.db}"

  console.log("connecting to #{url}")

  client.connect(url, (err, db) ->
    if err?
      console.log("Error creating mongo connection.", err)
      _done(err, null)
    else
      tree.on('destroy', -> db.close())
      _done(null, db)
  )


