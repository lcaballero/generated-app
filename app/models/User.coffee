Scheming = require 'scheming'


module.exports = (mongo) ->

  reqString = -> {
    type      : String
    required  : true
  }

  collection = mongo.collection("User")

  User = Scheming.create('User', {
    username: reqString()
    password: reqString()
  })

  User.insertOne = (user, cb) ->
    if !cb?
      throw new Error("Callback is required")
    else
      collection.insertOne(user, cb)

  User.findByUsername = (user, cb) ->
    collection.find({ username: user.username })
      .toArray((err, docs) ->
        if err?
          cb(err, null)
        else if docs.length is 0
          cb(null, null)
        else if docs.length > 1
          cb(new Error("Found more than one user."))
        else
          cb(null, docs)
      )


  User

