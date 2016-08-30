# Require Rake Tasks
require "sinatra/activerecord/rake"
require 'yaml'

database_cxn = YAML.load_file('./config/database.yml')


# Connect to the Database
ActiveRecord::Base.establish_connection(database_cxn[ENV['RACK_ENV']])


