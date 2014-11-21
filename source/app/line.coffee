
React = require 'react'
_ = require 'lodash'

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
    [4..0].map (x) =>
      size = 10 + (2 ** (x + 1))
      style =
        fontSize: size
        lineHeight: "#{1.4 * size}px"
      $.div key: x, style: style, @props.data

  render: ->
    size = 10 + (2 ** 6)
    fontStyle = type.guessStyle @props.type
    inputStyle = _.merge {fontSize: size, lineHeight: "#{size * 1.4}px"}, fontStyle
    $.div className: 'app-line', style: fontStyle,
      $.div style: fontStyle, className: 'name', @props.type
      $.div className: 'sizes',
        $.input style: inputStyle, onChange: @onChange, value: @props.data
        @renderSizes()