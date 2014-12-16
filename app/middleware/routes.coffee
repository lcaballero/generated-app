passport = require('passport')


module.exports = (config, express, app, session, HomeController, LoginController) ->

  routes = express.Router()

  render = (page, data) -> (req, res) ->
    res.render(page, data)

  auth = passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login'
  })

  routes.use((req, res, next) ->
    res.locals.config = config
    next()
  )

  routes.get  "/"           , HomeController.index
  routes.get  "/hello"      , HomeController.hello
  routes.get  "/data"       , HomeController.data
  routes.get  "/user"       , HomeController.user
  routes.get  "/add"        , HomeController.add
  routes.get  "/see"        , HomeController.see
  routes.get  "/login"      , render 'pages/loginForm', {}
  routes.post "/login"      , auth

  routes
