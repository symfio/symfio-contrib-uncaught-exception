# symfio-contrib-uncaught-exception

> Uncaught exception plugin.

## Usage

```coffee
symfio = require "symfio"

container = symfio "example", __dirname

container.set "uncaught exception notification emails", "test@example.com"
container.set "email host", "localhost"
container.set "email port", 25

loader = container.get "loader"

loader.use require "symfio-contrib-nodemailer"
loader.use require "../lib/uncaught-exception"

loader.load()
```

## Required plugins

* [contrib-nodemailer](https://github.com/symfio/symfio-contrib-nodemailer)

## Must be configured

* __uncaught exception notification emails__ - Should be array or string.
