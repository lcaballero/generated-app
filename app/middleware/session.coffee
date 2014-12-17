passport      = require 'passport'
LocalStrategy = require('passport-local').Strategy


module.exports = (User) ->

  passport.use(new LocalStrategy(
    (username, password, done) ->
      User.findByUsername(username, (err, user) ->
        if err?
          done(err)
        else if !user?
          done(null, false, { message: "Incorrect user credentials."})
        else if !user.validPassword(password)
          done(null, false, { message: "Incorrect user credentials."})
        else
          done(null, user)
      )
    )
  )

  passport.serializeUser((user, done) ->
    done(null, user.id)
  )

  passport.deserializeUser((id, done) ->
    User.findById(id, (err, user) ->
      done(err, user)
    )
  )
