class TemplatoJade
	constructor: ->
		@engine = require 'jade'
	
	compile: (template) ->
		@engine.compile template
	
	render: (fn, data) ->
		fn(data)

module.exports = TemplatoJade if module?