passport = require('passport')


module.exports = (
  config, express, app,
  HomeController, LoginController) ->

  console.log("routes.coffee")

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
  routes.get  "/index"      , auth, HomeController.index

  routes.get  "/add"        , HomeController.add
  routes.get  "/socket"     , HomeController.socket

  routes.get  "/login"      , render('pages/login-form', {})
  routes.post "/login"      , LoginController.authenticate

  routes.get  "/upload"     , render('pages/upload-form')
  routes.post "/upload"     , HomeController.upload

  routes.get  "/components"  , HomeController.components

  app.use routes
  routes
