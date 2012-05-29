class TemplatoEco
	constructor: ->
		throw new Error('Eco is available only for Node.js.') if not module?
		
		@eco = require 'eco'
	
	compile: (template) ->
		@eco.compile template
	
	render: (fn, data) ->
		fn(data)

module.exports = TemplatoEco if module?