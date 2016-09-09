#  CONFIGURATION FILE
#  ==================

#  Require bundler for grabbing gems
#  ---------------------------------
require 'bundler'
require 'yaml'
require 'mysql2'


# ENV['RACK_ENV'] ||= 'production'
#  Active environment setting
#  --------------------------
Bundler.require :default, ENV['RACK_ENV'].to_sym


ENV["RACK_ENV"] ||= "development"

full_config = YAML.load_file('./config/database.yml') || {}
env_config  = full_config[ENV['RACK_ENV']] || {}
AppConfig    = OpenStruct.new(env_config)


if ENV['DATABASE_URL']
  Bundler.require(:production)
  DB = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  Bundler.require(:development)
  DB = ActiveRecord::Base.establish_connection(
    :adapter => AppConfig["adapter"],
    :database => AppConfig["database"]
  )
end


#  Setup connection with Active Record
#  -----------------------------------
ActiveRecord::Base.establish_connection(full_config[ENV['RACK_ENV']])

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
