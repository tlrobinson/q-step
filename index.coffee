
Q = require "q"

QStep = (fns...) ->
  fns.reduceRight((next, fn) ->
    (args...) ->
      Q.try ->
        fn.apply(@, args)
      .then next
  , (x) -> x)()

module.exports = QStep
