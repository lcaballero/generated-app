passport      = require 'passport'
LocalStrategy = require('passport-local').Strategy


module.exports = (mongo) ->
  Users =
    findOne: (q, cb) ->
      cb(new Error("No user"))
    findById: (id, cb) ->
      cb(new Error("No user"))

  passport.use(new LocalStrategy(
    (username, password, done) ->
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

  passport.serializeUser((user, done) ->
    console.log("serializeUser")
    done(null, user.id)
  )

  passport.deserializeUser((id, done) ->
    console.log("deserializeUser")
    User.findById(id, (err, user) ->
      console.log('findById')
      done(err, user)
    )
  )
