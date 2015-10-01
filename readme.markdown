How to Use elm-reactor With Custom HTML (While Installing Elm Via npm)
======================================================================

* `npm install` to install the Elm platform from npm. This also runs `elm-make` once to build `elm.js`.
* `npm start` starts elm-reactor with the correct ELM_HOME set (alternatively, you could do `ELM_HOME=node_modules/elm/share node_modules/.bin/elm-reactor` manually).
* Go to  <http://localhost:8000/index.html>.
* You now see the Elm app including your custom HTML and CSS.
    * Live reload works: Change the elm file, your browser is updated automatically (live reload does not work for changes in the static HTML or CSS, you'll have to do a refresh manually for those)
    * You can use the integrated Elm debugger.
