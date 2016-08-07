# Require Rake Tasks
require "sinatra/activerecord/rake"

# Connect to the Database
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db.sqlite3'
  )


# Rake Tasks
# Set Environment
desc "Set up the environment"
task :environment do
  ENV['RACK_ENV'] ||= 'development'
end


# Run Dependent Tasks and Start Server
namespace :server do
  desc "Start the server"
  task :start => [:environment] do
    exec "rerun rackup"
  end
end

