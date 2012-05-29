if module?
	TemplatoEJS = require './engines/ejs'
	TemplatoEco = require './engines/eco'
	TemplatoMustache = require './engines/mustache'
	TemplatoJade = require './engines/jade'

class Templato
	@registerHelper: (name, helper) ->
		@helpers = {} if not @helpers
		@helpers[name] = helper
	
	@detectEngine: (extension) ->
		switch extension
			when 'ejs' then 'ejs'
			when 'eco' then 'eco'
			when 'mu', 'mustache' then 'mustache'
			when 'jade' then 'jade'
	
	constructor: ->
		@helpers = {}
	
	set: (options) ->
		@engine = switch options.engine
			when 'ejs' then new TemplatoEJS
			when 'eco' then new TemplatoEco
			when 'mustache', 'mu' then new TemplatoMustache
			when 'jade' then new TemplatoJade
		
		if options.template
			@template = options.template
			delete @fn
	
	registerHelper: (name, helper) ->
		@helpers[name] = helper
	
	compile: ->
		return @fn if @fn
		
		return @fn = @engine.compile @template
	
	render: (data = {}) ->
		for helper of @helpers
			data[helper] = @helpers[helper]
		for helper of Templato.helpers
			data[helper] = Templato.helpers[helper]
		
		@engine.render @compile(), data

module.exports = Templato if module?