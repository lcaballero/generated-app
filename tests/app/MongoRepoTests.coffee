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

    username = _.uuid()

    beforeEach (done) ->
      User.insertOne({ username: username }, (err, res) ->
        done()
      )

    it "should find users(1) already inserted", (done) ->
      User.findByUsername(new User({
        username: username
      }), (err, res) ->
        if err?
          console.log(err)
        else
          expect(res).to.have.length(1)
          done()
      )