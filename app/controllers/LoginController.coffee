

module.exports = (mongo) ->

  users = mongo.collection("Users")

  loginForm: (req, res, next) ->
    res.render "pages/login-form"


  authenticate: (req, res, next) ->
