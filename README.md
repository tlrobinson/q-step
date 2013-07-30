# QStep

A simple control flow function for JavaScript promises, similar to creationix/step

## Example

Using the `wd` WebDriver library with [QProxy](http://github.com/tlrobinson/q-proxy) in CoffeeScript:

    browser = QProxy(wd.promiseRemote("localhost", 4444))
    loginFacebook = (credentials) ->
      QStep(
        -> browser.init(browserName: "firefox")
        -> browser.get("https://www.facebook.com/")
        -> browser.elementById("email").type(credentials.email)
        -> browser.elementById("pass").type(credentials.password)
        -> browser.elementById("u_0_b").click()
      )

Errors are propagated to the promise returned from QStep, unless they're handled within one of the steps:

    loginFacebook(credentials).then ->
      console.log "success!"
    , (err) ->
      console.log "error :(", err
