'use strict'

{assert} = require 'chai'
{spy}    = require 'sinon'

path = require.resolve '../src/raf'
raf  = null

suite 'raf:', ->
  callback = ->

  suite 'window:', ->

    suite 'native:', ->

      setup ->
        delete require.cache[path]
        global.window = {}
        global.window.requestAnimationFrame = ->
        global.window.cancelAnimationFrame = ->
        raf = require path

      test '`raf.requestAnimationFrame` is `window.requestAnimationFrame`', ->
        assert.strictEqual global.window.requestAnimationFrame, raf.requestAnimationFrame

      test '`raf.cancelAnimationFrame` is `window.cancelAnimationFrame`', ->
        assert.strictEqual global.window.cancelAnimationFrame, raf.cancelAnimationFrame

    suite 'gecko:', ->

      setup ->
        delete require.cache[path]
        global.window = {}
        global.window.mozRequestAnimationFrame = ->
        global.window.mozCancelAnimationFrame = ->
        raf = require path

      test '`raf.requestAnimationFrame` is `window.mozRequestAnimationFrame`', ->
        assert.strictEqual global.window.mozRequestAnimationFrame, raf.requestAnimationFrame

      test '`raf.cancelAnimationFrame` is `window.mozCancelAnimationFrame`', ->
        assert.strictEqual global.window.mozCancelAnimationFrame, raf.cancelAnimationFrame

    suite 'opera:', ->

      setup ->
        delete require.cache[path]
        global.window = {}
        global.window.oRequestAnimationFrame = ->
        global.window.oCancelAnimationFrame = ->
        raf = require path

      test '`raf.requestAnimationFrame` is `window.oRequestAnimationFrame`', ->
        assert.strictEqual global.window.oRequestAnimationFrame, raf.requestAnimationFrame

      test '`raf.cancelAnimationFrame` is `window.oCancelAnimationFrame`', ->
        assert.strictEqual global.window.oCancelAnimationFrame, raf.cancelAnimationFrame

    suite 'trident:', ->

      setup ->
        delete require.cache[path]
        global.window = {}
        global.window.msRequestAnimationFrame = ->
        global.window.msCancelAnimationFrame = ->
        raf = require path

      test '`raf.requestAnimationFrame` is `window.msRequestAnimationFrame`', ->
        assert.strictEqual global.window.msRequestAnimationFrame, raf.requestAnimationFrame

      test '`raf.cancelAnimationFrame` is `window.msCancelAnimationFrame`', ->
        assert.strictEqual global.window.msCancelAnimationFrame, raf.cancelAnimationFrame

    suite 'webkit:', ->

      setup ->
        delete require.cache[path]
        global.window = {}
        global.window.webkitRequestAnimationFrame = ->
        global.window.webkitCancelAnimationFrame = ->
        raf = require path

      test '`raf.requestAnimationFrame` is `window.webkitRequestAnimationFrame`', ->
        assert.strictEqual global.window.webkitRequestAnimationFrame, raf.requestAnimationFrame

      test '`raf.cancelAnimationFrame` is `window.webkitCancelAnimationFrame`', ->
        assert.strictEqual global.window.webkitCancelAnimationFrame, raf.cancelAnimationFrame

    suite 'multiple:', ->

      setup ->
        delete require.cache[path]
        global.window = {}
        global.window.requestAnimationFrame = ->
        global.window.cancelAnimationFrame = ->
        global.window.mozRequestAnimationFrame = ->
        global.window.mozCancelAnimationFrame = ->
        global.window.oRequestAnimationFrame = ->
        global.window.oCancelAnimationFrame = ->
        global.window.msRequestAnimationFrame = ->
        global.window.msCancelAnimationFrame = ->
        global.window.webkitRequestAnimationFrame = ->
        global.window.webkitCancelAnimationFrame = ->
        raf = require path

      test '`raf.requestAnimationFrame` is `window.requestAnimationFrame`', ->
        assert.strictEqual global.window.requestAnimationFrame, raf.requestAnimationFrame

      test '`raf.cancelAnimationFrame` is `window.cancelAnimationFrame`', ->
        assert.strictEqual global.window.cancelAnimationFrame, raf.cancelAnimationFrame

  suite 'window-less:', ->

    setup ->
      delete require.cache[path]
      raf = require path

    suite 'requestAnimationFrame:', ->

      test '`raf.requestAnimationFrame` is a function', ->
        assert.isTrue typeof raf.requestAnimationFrame is 'function'

    suite 'cancelAnimationFrame:', ->

      test '`raf.cancelAnimationFrame` is a function', ->
        assert.isTrue typeof raf.cancelAnimationFrame is 'function'
