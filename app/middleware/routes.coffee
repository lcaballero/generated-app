passport = require('passport')


module.exports = (config, express, app, session, HomeController, LoginController) ->

  routes = express.Router()

  render = (page, data) -> (req, res) ->
    res.render(page, data)

  routes.use((req, res, next) ->
    res.locals.config = config
    next()
  )

  auth = LoginController.ensureAuthenticated

  routes.get  "/"           , auth, HomeController.index
  routes.get  "/hello"      , auth, HomeController.hello
  routes.get  "/data"       , auth, HomeController.data
  routes.get  "/user"       , auth, HomeController.user
  routes.get  "/see"        , auth, HomeController.see

  routes.get  "/add"        , HomeController.add
  routes.get  "/login"      , render('pages/login-form', {})
  routes.post "/login"      , LoginController.authenticate

  routes
