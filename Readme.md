# Templato

Templato is a library for browsers and Node.js, which provides one interface to many templating engines.

# Installation

For browsers:

```html
<script src="engines/ejs.min.js"></script> <!-- include only those engines you need -->
<script src="engines/jade.min.js"></script>
<script src="engines/mustache.min.js"></script>

<script src="templato.min.js"></script>
```

For Node.js:

```javascript
var Templato = require('templato');
```

# Usage

```javascript
Templato.registerHelper('uppercase', function(arg){ // registering helper for all templates
	arg.toUpperCase();
});

var template = new Templato;
template.registerHelper('downcase', function(arg){ // registering helper only for this template
	arg.toLowerCase();
});
template.set({
	engine: 'ejs',
	template: '<%= uppercase('hello') %>, <%= attr %> <%= downcase('WORLD') %>!'
});
template.render({ attr: 'beautiful' }); // "HELLO, beautiful world!"
```

# Available engines

- EJS
- Eco **(only for Node.js)**
- Jade
- Mustache

# Tests

Run tests this way:

- ```mocha test/node/*``` for Node.js
- open ```test/browser/test.html``` in browsers, if you want to test Templato in browser

# License

(The MIT License)

Copyright (c) 2011 Vadim Demedes sbioko@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.