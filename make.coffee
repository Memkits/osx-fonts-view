
require 'shelljs/make'
fs = require 'fs'
{renderer} = require 'cirru-html'

station = require 'devtools-reloader-station'
station.start()

target.html = ->
  page = 'cirru/index.cirru'
  render = renderer (cat page), '@filename': page
  render().to 'index.html'
  console.log 'wrote to index.html'
  station.reload 'repo/osx'

target.coffee = ->
  exec 'coffee -o js/ -wbc coffee/', async: yes
  fs.watch 'js/', interval: 200, ->
    exec 'browserify -o build/build.js -d js/main.js', ->
      console.log 'browserify ok'
      station.reload 'repo/osx'

target.watch = ->
  fs.watch 'cirru/', interval: 200, target.html
  target.html()
  target.coffee()