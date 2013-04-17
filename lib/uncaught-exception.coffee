module.exports = (container, callback) ->
  project = container.get "name"
  logger = container.get "logger"
  emails = container.get "uncaught exception notification emails", []
  emails = [emails] if typeof emails is "string"
  email = container.get "email"

  logger.info "loading plugin", "symfio-contrib-uncaught-exception"

  process.on "uncaughtException", (err) ->
    body = """
      #{err.message}

      #{err.stack}
    """

    emails.forEach (to) ->
      email to, "#{project} catch uncaught exception", body, ->

  callback()
