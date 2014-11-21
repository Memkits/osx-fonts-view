
React = require 'react'
_ = require 'lodash'

$ = React.DOM

config =
  height: 80
  buffer: 80

types = require '../list'
FontLine = require './font-line'

module.exports = React.createFactory React.createClass
  displayName: 'font-list'

  getInitialState: ->
    sample: 'Fonts in OS X'
    showing: types.map -> 'Fonts in OS X'

  computeVisibility: (index) ->
    unless @refs.box? then return true
    y = index * config.height
    top = @refs.box.getDOMNode().scrollTop
    buf = config.buffer
    (top - buf) < y < (top + innerHeight + buf)

  componentDidMount: ->
    @throttleScroll = _.throttle =>
      @forceUpdate()
    , 200

  onScroll: ->
    @throttleScroll()

  onChange: (text) ->
    @setState sample: text

  renderNodes: ->
    types.map (type, index) =>
      visibility = @computeVisibility index
      sample = if visibility then @state.sample else ''
      fakeType = if visibility then type else ''
      FontLine key: type, type: fakeType, data: sample, onChange: @onChange

  render: ->
    $.div id: 'font-box', ref: 'box', onScroll: @onScroll,
      $.div id: 'font-list',
        @renderNodes()
