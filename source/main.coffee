
React = require 'react'

config =
  height: 80
  buffer: 80

$ = React.DOM

{EventEmitter} = require 'events'

chan = new EventEmitter

typeList = require './type'

store =
  types: require './list'
  sample: 'Fonts in OS X'
  scrollTop: 0

FontLine = React.createClass
  displayName: 'font-line'

  render: ->

    sample = store.sample
    type = @props.data

    $.div
      className: 'font-line'
      style: typeList.guess type
      $.input
        className: 'font-input'
        ref: 'input'
        onChange: =>
          store.sample = @refs.input.getDOMNode().value
          chan.emit 'change'
        value: sample
      $.div
        className: 'font-name'
        type

FontList = React.createClass
  displayName: 'font-list'

  componentDidMount: ->
    chan.on 'change', =>
      @forceUpdate()

  render: ->

    w = window.innerWidth
    h = window.innerHeight
    heightBefore = 0
    heighAfter = 0

    fontNodes = []

    for type, index in store.types
      y = index * config.height
      top = store.scrollTop
      buf = config.buffer
      # console.log y, top, buf, h, w
      if y < top - buf
        heightBefore += config.height
      else if y < top + h + buf
        fontNodes.push FontLine data: type, key: index
      else
        heighAfter += config.height

    $.div
      id: 'font-box'
      ref: 'box'
      onScroll: =>
        store.scrollTop = @refs.box.getDOMNode().scrollTop
        chan.emit 'change'
      $.div
        id: 'font-list'
        $.div
          id: 'space-before'
          style:
            height: "#{heightBefore}px"
        fontNodes
        $.div
          id: 'space-after'
          style:
            height: "#{heighAfter}px"

React.renderComponent (FontList {}),
  document.querySelector('body')