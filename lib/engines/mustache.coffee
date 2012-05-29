class TemplatoMustache
	constructor: ->
		@engine = if module? then require('../../vendor/hogan/hogan') else Hogan
	
	compile: (template) ->
		@engine.compile template
	
	render: (fn, data) ->
		fn.render data

module.exports = TemplatoMustache if module?