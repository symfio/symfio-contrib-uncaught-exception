symfio = require "symfio"

module.exports = container = symfio "example", __dirname
container.set "uncaught exception notification emails", "test@example.com"
container.set "email host", "localhost"
container.set "email port", 25

loader = container.get "loader"
logger = container.get "logger"

loader.use require "symfio-contrib-nodemailer"
loader.use require "../lib/uncaught-exception"

loader.use (container, callback) ->
  setTimeout ->
    logger.info "throwing exception"
    throw new Error
  , 1000

  callback()

loader.load() if require.main is module
