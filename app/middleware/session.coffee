passport      = require 'passport'
LocalStrategy = require('passport-local').Strategy


module.exports = ->
  Users =
    findOne: (q, cb) ->
      cb(new Error("No user"))

  passport.use(new LocalStrategy(
      (username, password, done) ->
        console.log("Users?", Users?)
        Users.findOne({ username: username }, (err, user) ->
          if err?
            return done(err)
          if !user?
            return done(null, false, { message: "Incorrect user credentials."})
          if !user.validPassword(password)
            return done(null, false, { message: "Incorrect user credentials."})
          return done(null, user)
        )
    )
  )
