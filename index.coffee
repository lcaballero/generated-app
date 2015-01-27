spawn   = require('child_process').spawn
path    = require 'path'


expressApp = path.resolve(process.cwd(), './app/index.coffee')

console.log('expressApp', expressApp)

spawn('./node_modules/.bin/node-dev', ['--no-deps', expressApp], { stdio: 'inherit' })

