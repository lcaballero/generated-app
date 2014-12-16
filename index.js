spawn = require('child_process').spawn

spawn('./node_modules/.bin/node-dev', ['--no-deps', './app/index.coffee'], { stdio: 'inherit' })

