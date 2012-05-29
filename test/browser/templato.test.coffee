if module?
	Templato = require '../../'
	expect = require './js/expect'

Templato.registerHelper 'uppercase', (arg) ->
	arg.toUpperCase()

describe 'Templato', ->
	describe 'EJS', ->
		it 'should render ejs', ->
			templato = new Templato
			templato.registerHelper 'downcase', (arg) ->
				arg.toLowerCase()
			templato.set engine: 'ejs', template: '<%= uppercase("Hello") %> <%= downcase("World") %>'
			expect(templato.render()).to.be('HELLO world')
	
	describe 'Mustache', ->
		it 'should render mustache', ->
			templato = new Templato
			templato.registerHelper 'downcase', (arg) ->
				arg.toLowerCase()
			templato.set engine: 'mu', template: '{{#uppercase}}Hello{{/uppercase}} {{#downcase}}World{{/downcase}}'
			expect(templato.render()).to.be('HELLO world')
	
	describe 'Jade', ->
		it 'should render jade', ->
			templato = new Templato
			templato.registerHelper 'downcase', (arg) ->
				arg.toLowerCase()
			templato.set engine: 'jade', template: '!= uppercase("Hello")'
			expect(templato.render()).to.be('HELLO')
	
	if module?
		describe 'Eco', ->
			it 'should render eco', ->
				templato = new Templato
				templato.registerHelper 'downcase', (arg) ->
					arg.toLowerCase()
				templato.set engine: 'eco', template: '<%= @uppercase "Hello" %> <%= @downcase "World" %>'
				expect(templato.render()).to.be('HELLO world')