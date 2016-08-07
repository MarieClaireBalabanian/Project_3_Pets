#  CONFIGURATION FILE
#  ==================

#  Require bundler for grabbing gems
#  ---------------------------------
require 'bundler'

#  Active environment setting
#  --------------------------
Bundler.require :default, ENV['RACK_ENV'].to_sym

#  Setup connection with Active Record
#  -----------------------------------
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db.sqlite3'
)

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
