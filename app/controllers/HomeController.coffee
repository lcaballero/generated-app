_           = require 'lodash'
formidable  = require 'formidable'
util        = require 'util'
os          = require 'os'

module.exports = (User) ->

  index: (req, res, next) ->
    res.render "pages/index", { action: 'index' }

  hello: (req, res, next) ->
    res.send "Hello, World!"

  data: (req, res, next) ->
    res.send JSON.stringify({hello:'world!'})

  user: (req, res, next) ->
    name = req.param('username')
    User.find({username: name}, (err, docs) ->
      if err?
        console.log(err)
      else
        if docs.length is 0
          res.send("#{name} isn't in the system ")
        else
          res.send("#{name} is in the system")
    )

  add: (req, res, next) ->
    name    = req.param('username')
    pw      = req.param('password')
    newUser = new User { username:name, password: pw, id: _.uuid() }

    User.find({username: name}, (err, docs) ->
      if err?
        console.log(err)
      else
        if docs.length > 0
          res.send("#{name} is already in the system")
        else
          newUser.save((e2, r2) ->
            if e2?
              console.log(e2)
            else
              res.send("Added #{name}")
          )
    )

  see: (req, res, next) ->
    s = ["Properties of req.params"]

    for p in req.params
      s.push(p)

    s.push("req.query")
    s.push(req.query.name)
    for p in req.query
      s.push(p)

    r = s.join("<br/>") + JSON.stringify(req.config, null, '  ')
    res.send(r)

  socket : (req, res, next) ->
    res.render "pages/socket-example", {}

  upload : (req, res, next) ->
    form = new formidable.IncomingForm()
    form.parse(req, (err, fields, files) ->
      res.writeHead(200, { 'content-type' : 'text/plain' })
      res.write('received file upload:\n\n')
      res.write('file to be placed here:' + os.tmpDir())
      res.write('\n\n')
      res.end(util.inspect({ fields: fields, files:files }))
    )

  components : (req, res, next) ->
    res.render "pages/component-page", {}

  nodes : (req, res, next) ->
    res.render "pages/nodes", {}



