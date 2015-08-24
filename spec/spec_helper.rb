ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('pry')
require("sinatra/activerecord")
require('./lib/player')
require('./lib/team')
