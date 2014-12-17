deps      = require './deps'
Scheming  = require 'scheming'


describe 'MongoRepoTests =>', ->

  mongo = null
  User  = null
  tree  = null

  beforeEach (done) ->
    tree = deps()
    tree.resolve((err, resolved) ->
      if err?
        console.log(err)
      else
        { mongo, User } = resolved
        done()
    )

  afterEach (done) ->
    tree.destroy(-> done())

  afterEach ->
    Scheming.reset()

  it "should have setup values", ->
    expect(mongo, 'mongo').to.exist
    expect(User, 'User').to.exist

  it "should insert a new user", (done) ->
    User.insertOne(new User({
      username: "Arthur Curry"
      password: "Aquaman"
    }), (err, res) ->
      expect(err).to.not.exist
      done()
    )

  describe 'find user =>', ->

    username  = _.uuid()
    id        = _.uuid()

    beforeEach (done) ->
      new User({ username: username, id: id })
        .save((err, res) ->
          if err?
            console.log(err)
          else
            done()
        )

    it "should find users(1) already inserted", (done) ->
      User.findByUsername(username, (err, res) ->
        if err?
          console.log(err)
        else
          expect(res).to.have.length(1)
          done()
      )

    it "should find the user by id", (done) ->
      User.findById(id, (err, res) ->
        if err?
          console.log(err)
        else
          done()
      )