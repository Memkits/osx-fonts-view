
React = require 'react'
_ = require 'lodash'

$ = React.DOM

config =
  height: 240

types = require '../list'
Line = require './line'

module.exports = React.createFactory React.createClass
  displayName: 'app-table'

  getInitialState: ->
    sample: 'Fonts in OS X'
    showing: types.map -> 'Fonts in OS X'

  computeVisibility: (index) ->
    unless @refs.box? then return true
    y = index * config.height
    top = @refs.box.getDOMNode().scrollTop
    (top - config.height) < y < (top + innerHeight + config.height)

  componentDidMount: ->
    @slowScroll = _.throttle =>
      @forceUpdate()
    , 80

  onScroll: ->
    @slowScroll()

  onChange: (text) ->
    @setState sample: text

  renderNodes: ->
    types.map (type, index) =>
      visibility = @computeVisibility index
      sample = if visibility then @state.sample else ''
      fakeType = if visibility then type else ''
      Line key: type, type: fakeType, data: sample, onChange: @onChange

  render: ->
    $.div className: 'app-table', ref: 'box', onScroll: @onScroll,
      @renderNodes()
