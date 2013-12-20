
define (require, exports) ->
  console.log 'start'

  Ractive = require 'Ractive'
  require 'tap'
  parse = require('parser').parse
  parse.compact = yes
  c2m = require 'c2m'
  font_tmpl = require 'text!cirru/view.cr'
  types = require 'json!data/types.json'
  
  mustache = c2m.render (parse font_tmpl)

  view = new Ractive
    el: document.querySelector('#root')
    data:
      list: types
      text: 'OS X: Fonts included with Mavericks'
      pointer: 0
      at: (index, pointer) ->
        if index is pointer then 'at'
        else ''
      compute: (name) ->
        styles = []
        if name.match /Bold/i
          styles.push 'font-weight: bold;'
          name = name.replace /Bold/i, ''
        if name.match /Light/i
          styles.push 'font-weight: lighter;'
          name = name.replace /Light/i, ''
        if name.match /Italic/i
          styles.push 'font-style: italic;'
          name = name.replace /Italic/i, ''
        if name.replace /Regular/i, ''
          name = name.replace /Regular/i, ''
        name = name.trim()
        styles.push "font-family: '#{name}';"
        styles.join ' '

    template: mustache

  view.on 'expand', (context) ->
    view.set 'pointer', context.index.num