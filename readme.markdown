How to Use elm-reactor With Custom HTML (While Installing Elm Via npm)
======================================================================


Setup
-----
* `npm install` to install the Elm platform from npm as a local dependency. This also runs `elm-make` once to build `elm.js`.


Development Mode
----------------

* `npm run dev` starts elm-reactor with the correct ELM_HOME set (alternatively, you could do `ELM_HOME=node_modules/elm/share node_modules/.bin/elm-reactor` manually).
* Go to <http://localhost:8000/index.debug.html>.
* You now see the Elm app including your custom HTML and CSS.
    * Live reload works: If you change the elm file, your browser is updated automatically. To see this in action, simply change the string that says "change this text" in the `main` function around line 22.
    * Live reload does *not* work for changes in the static HTML or CSS, you'll have to do trigger a browser refresh manually for those.
    * You can use the integrated Elm debugger.


Pseudo Production Mode
----------------------

* `npm start` starts the app in "production mode" by simply building it with `elm-make` and then serving it via [http-server](https://github.com/indexzero/http-server).
* Go to <http://localhost:8080/index.html>.
    * This is the production view. No live reload, no debugger.
    * If you change the code, you need to rebuild `elm.js` by executing `npm run make` or by stopping the running http-server and execute `npm start` again (which will also trigger `npm run make`).


Remark
------

This setup uses two separate HTML files for development and production. The reason is that for debugging we need to include `/_reactor/debug.js` and start the the app with `Elm.fullscreenDebug` instead of `Elm.fullscreen`. If you have non-trivial static html, having to maintain two separate copies of it is an obvious drawback. In a more sophisticated setup you could solve this by serving index.html from a backend with support for server side templating. For example you could switch between dev mode and production mode controlled by an environment variable, let's say, `ELM_DEV_MODE`. That is, include the script tag for `/_reactor/debug.js` only if `ELM_DEV_MODE` is set, same for the switch between `Elm.fullscreenDebug` instead of `Elm.fullscreen`.
