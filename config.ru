#  CONFIGURATION FILE
#  ==================

#  Require bundler for grabbing gems
#  ---------------------------------
require 'bundler'
require 'yaml'


# ENV['RACK_ENV'] ||= 'production'
#  Active environment setting
#  --------------------------
Bundler.require :default, ENV['RACK_ENV'].to_sym

database_cxn = YAML.load_file('./config/database.yml')


#  Setup connection with Active Record
#  -----------------------------------
ActiveRecord::Base.establish_connection(database_cxn[ENV['RACK_ENV']])

#  Require models
#  --------------
require './app/models/user'
require './app/models/pet'

#  Require controllers
#  -------------------
require './app/controllers/application_controller'
require './app/controllers/users_controller'
require './app/controllers/pets_controller'

#  Map routes
#  ----------
map('/pets')  { run PetsController }
map('/')      { run UsersController }
