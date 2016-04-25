ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'server'
require_relative './models/song'
require_relative './models/user'
require_relative './models/datamapper_setup'
