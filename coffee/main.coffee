
Vue = require 'vue'
types = require '../data/types.json'

vm = new Vue
  el: '#app'
  data:
    list: types
    text: 'OS X: Fonts included with Mavericks'
    at: 0
  methods:
    styleOf: (name) ->
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
