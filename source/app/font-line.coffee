
React = require 'react'

type = require '../type'

$ = React.DOM


module.exports = React.createFactory React.createClass
  displayName: 'font-line'

  componentWillUpdate: (props, state) ->
    if props.data isnt @props.data then return true
    if props.type isnt @props.type then return true
    return false

  onChange: (event) ->
    @props.onChange event.target.value

  render: ->
    style = type.guessStyle @props.type
    $.div className: 'font-line', style: style,
      $.input className: 'font-input', onChange: @onChange, value: @props.data
      $.div className: 'font-name', @props.type