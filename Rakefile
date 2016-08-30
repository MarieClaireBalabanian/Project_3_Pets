# Require Rake Tasks
require "sinatra/activerecord/rake"
require "yaml"

database_cxn = YAML.load_file('./config/database.yml')

# Connect to the Database
ActiveRecord::Base.establish_connection(database_cxn[ENV['RACK_ENV']])


# # Rake Tasks
# # Set Environment
# desc "Set up the environment"
# task :environment do
#   ENV['RACK_ENV'] ||= 'development'
# end


# # Run Dependent Tasks and Start Server
# namespace :server do
#   desc "Start the server"
#   task :start => [:environment] do
#     exec "rerun rackup"
#   end
# end

