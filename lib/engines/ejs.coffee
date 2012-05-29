class TemplatoEJS
	constructor: ->
		@ejs = require 'ejs'
	
	compile: (template) ->
		@ejs.compile template
	
	render: (fn, data) ->
		fn(data)

module.exports = TemplatoEJS if module?