passport = require 'passport'



module.exports = (User) ->

  authenticate: (req, res, next) ->
    passport.authenticate('local', (err, user, info) ->
      if err?
        next(err)
      else if not user?
        return res.redirect('/login')
      else
        req.logIn(user, (err) ->
          if err?
            next(err)
          else
            res.redirect('/')
        )
    )(req, res, next)

  ensureAuthenticated: (req, res, next) ->
    if req.isAuthenticated()
      next()
    else
      res.redirect('/login')

  logout : (req, res, next) ->
    req.lgout()
    res.redirect('/login')