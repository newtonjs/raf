# newtonjs/raf #

RequestAnimationFrame polyfill. Kinda.

**Version:** *0.1.0*<br/>
**Build status:** [![Build Status][travis-status]][travis]


### Usage ###

```js
var raf = require('newtonjs-raf');

var animate, id;
(animate = function (time) {
  // Render the current frame...

  // ...then request the next one
  id = raf.requestAnimationFrame(animate);
})(0);

if (/* Some condition */) {
  raf.cancelAnimationFrame(id);
}
```

This library doesn't monkey patch the `window` object (hence "kinda"),
so depending on how you intend to use it, you may need to do this yourself.
```js
var raf = require('newtonjs-raf');

window.requestAnimationFrame = raf.requestAnimationFrame;
window.cancelAnimationFrame  = raf.cancelAnimationFrame;
```

If you would like a more useful interface to `requestAnimationFrame` than the browser specifies,
have a look at [**newtonjs/frame**][newtonjs-frame].


### Installation ###

This library isn't available from the NPM repository or any other
package manager, but you can still add it to your `package.json`

```json
{
  "dependencies": {
    "newtonjs-raf": "git://github.com/newtonjs/raf.git#master"
  }
}
```


### Contributing ###

We accept contributions to the source via Pull Request, but you must run the tests
and compile the JavaScript before it will be considered for merge.
The source for this library is written in CoffeeScript, but it is distributed with
the compiled JavaScript.

```bash
$ npm test                # Run tests
$ npm run-script compile  # Compile JavaScript
```


### License ###
The content of this library is released under the **MIT License** by **Andrew Lawson**.<br/>
You can find a copy of this license at http://www.opensource.org/licenses/mit


<!-- Links -->
[travis]: https://travis-ci.org/newtonjs/raf
[travis-status]: https://travis-ci.org/newtonjs/raf.png
[newtonjs-frame]: https://github.com/newtonjs/frame
