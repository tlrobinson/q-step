
Q = require "q"

QStep = (fns...) ->
  # Use new context unless one was suplied (with .apply, not default global)
  context = if @ is (->@)() then {} else @
  fns.reduceRight((next, fn) ->
    (args...) ->
      Q.try ->
        fn.apply(context, args)
      .then next
  , (x) -> x)()

module.exports = QStep
