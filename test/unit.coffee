symfio = require "symfio"
plugin = require "../lib/uncaught-exception"
suite = require "symfio-suite"


describe "uncaught-exception plugin", ->
  wrapper = suite.sandbox symfio, ->
  
  it "should set exception handler", wrapper ->
    @sandbox.stub process, "on"

    plugin @container, ->

    @expect(process.on).to.have.been.calledOnce
    @expect(process.on.firstCall.args[0]).to.equal "uncaughtException"

  it "should caught exception and send email", wrapper (callback) ->
    email = @sandbox.stub()

    @container.set "uncaught exception notification emails", "a@example.com"
    @container.set "email", email
    
    process.removeAllListeners "uncaughtException"
    plugin @container, ->
    
    process.nextTick ->
      throw new Error
    
    process.nextTick =>
      @expect(email).to.have.been.calledOnce
      callback()
