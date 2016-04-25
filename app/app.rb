ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'server'
