
React = require 'react'

type = require '../type'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'app-line'

  shouldComponentUpdate: (props, state) ->
    if props.data isnt @props.data then return true
    return false

  onChange: (event) ->
    @props.onChange event.target.value

  renderSizes: ->
    [3..0].map (x) =>
      size = x * 6 + 12
      style =
        fontSize: size
        lineHeight: "#{1.6 * size}px"
      $.div key: x, style: style, @props.data

  render: ->
    style = type.guessStyle @props.type
    style.fontSize = (3 * 6 + 12 + 12)
    style.lineHeight = "#{style.fontSize * 1.6}px"
    $.div className: 'app-line',
      $.div className: 'sizes',
        $.input style: style, onChange: @onChange, value: @props.data
        @renderSizes()
      $.div style: style, className: 'name', @props.type