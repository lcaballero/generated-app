Scheming = require 'scheming'
_        = require 'lodash'


module.exports = (mongo) ->

  users = mongo.collection("User")

  requiredString = { type : String, required  : true }

  User = Scheming.create('User', {
    username  : requiredString
    password  : requiredString
    email     : requiredString
    id :
      type    : String
      default : -> _.uuid()
  })

  User::save = (cb) -> User.insertOne(this, cb)
  User::validPassword = (pw) -> this.password is pw

  User.find = (q, cb) -> users.find(q).toArray(cb)

  User.insertOne = (user, cb) ->
    if !cb?
      throw new Error("Callback is required")
    else
      users.insertOne(new User(user), cb)

  User.findByUsername = (username, cb) ->
    users.find({ username: username })
      .toArray((err, docs) ->
        if err?
          cb(err, null)
        else if docs.length is 0
          cb(null, null)
        else if docs.length > 1
          cb(new Error("Found more than one user."))
        else
          console.log(docs.length, 'docs', JSON.stringify(docs))
          console.log(JSON.stringify(_.first(docs)))
          cb(null, new User(_.first(docs)))
      )

  User.findById = (id, cb) ->
    users.findOne({id : id}, {}, (err, res) ->
      if err?
        cb(err, null)
      else if !res?
        cb(new Error("Didn't find User with ID: #{id}"), null)
      else
        cb(null, new User(res))
    )

  User

