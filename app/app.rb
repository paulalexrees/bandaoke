ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'tilt/erb'
require 'pry'
require 'json'
require 'active_support'
require 'active_support/core_ext'
require 'net/http'
require 'dotenv'
Dotenv.load


require_relative 'server'
require_relative './models/song'
require_relative './models/user'
require_relative './models/role'
require_relative './models/datamapper_setup'
require_relative './lib/song_search'
require_relative './controllers/songs'
require_relative './controllers/roles'
