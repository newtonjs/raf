'use strict'

# CoffeeScript version of Erik Möller's polyfill (sans modifying the window)
# @link http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating

last = null
requestAnimationFrame = null
cancelAnimationFrame  = null

# Attempt to set a reference to window functions
if window?
  requestAnimationFrame = window.requestAnimationFrame
  cancelAnimationFrame  = window.cancelAnimationFrame

  # Traverse through vendor prefixed variants
  vendors = ['ms', 'moz', 'webkit', 'o']
  for vendor in vendors
    break if requestAnimationFrame
    requestAnimationFrame = window["#{vendor}RequestAnimationFrame"]
    cancelAnimationFrame  = window["#{vendor}CancelAnimationFrame"]

# Create requestAnimationFrame polyfill
unless requestAnimationFrame?
  requestAnimationFrame = (callback) ->
    now   = new Date().getTime()
    last  = now unless last?
    delay = Math.max 0, 16 - (now - last)
    last  = now + delay
    setTimeout ->
      callback last
    , delay

# Create cancelAnimationFrame polyfill
unless cancelAnimationFrame?
  cancelAnimationFrame = (id) ->
    clearTimeout id

module.exports = {
  cancelAnimationFrame
  requestAnimationFrame
}
