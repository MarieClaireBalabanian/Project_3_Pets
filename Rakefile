require "sinatra/activerecord/rake"
require 'yaml'
require 'ostruct'
require 'bundler'
Bundler.require

ENV["RACK_ENV"] ||= "development"

full_config = YAML.load_file('./config/database.yml') || {}
env_config  = full_config[ENV['RACK_ENV']] || {}
AppConfig    = OpenStruct.new(env_config)

namespace :db do
  desc "Create database based on a DATABASE_URL"
  task :create do
    begin
      case AppConfig['adapter']
      when /sqlite/
        if File.exist?(AppConfig['database'])
          $stderr.puts "#{AppConfig['database']} already exists"
        else
          # Create the SQLite database; just connecting is enough to create it.
          ActiveRecord::Base.establish_connection AppConfig.symbolize_keys
          ActiveRecord::Base.connection
          $stderr.puts "#{AppConfig['database']} created"
        end

      when /postgresql/
        encoding = AppConfig['encoding'] || ENV['CHARSET'] || 'utf8'
        ActiveRecord::Base.establish_connection AppConfig.symbolize_keys
        $stderr.puts "#{AppConfig['database']} created"
      end
    end
  end
end

# # Require Rake Tasks
# require "sinatra/activerecord/rake"
# require 'ostruct'
# require 'bundler'
# require 'yaml'
# require 'pry'


# ENV["RACK_ENV"] ||= "development"

# full_config = YAML.load_file('./config/database.yml') || {}
# env_config  = full_config[ENV['RACK_ENV']] || {}
# AppConfig    = OpenStruct.new(env_config)

# # debug
# #binding.pry


# if ENV['DATABASE_URL']
#   Bundler.require(:production)
#   DB = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
# else
#   Bundler.require(:development)
#   #binding.pry
#   DB = ActiveRecord::Base.establish_connection(
#     :adapter => AppConfig["adapter"],
#     :database => AppConfig["database"]
#   )
# end

# # Rake Tasks
# # Set Environment
# desc "Set up the environment"
# task :environment do
#  ENV['RACK_ENV'] ||= 'development'
#  if ENV['DATABASE_URL']
#    Bundler.require(:production)
#    #DB = Sequel.connect(ENV['DATABASE_URL'])
#  else
#    Bundler.require(:development)
#    #DB = Sequel.sqlite('development.sqlite') 
#  end
# end

# namespace :server do
#  desc "Start the server"
#  task :start => [:environment] do
#    system "rerun rackup"
#  end
# end

# namespace :db do
#   desc "Create database based on a DATABASE_URL"
#   task :create do
#     binding.pry
#     begin
#       case AppConfig['adapter']
#       when /sqlite3/
#         if File.exist?(AppConfig['database'])
#           $stderr.puts "#{AppConfig['database']} already exists"
#         else
#           # Create the SQLite database; just connecting is enough to create it.
#           binding.pry
#           p AppConfig
#           ActiveRecord::Base.establish_connection AppConfig.symbolize_keys
#           ActiveRecord::Base.connection
#           $stderr.puts "#{AppConfig['database']} created"
#         end

#       when /mysql2/
#         binding.pry
#         encoding = AppConfig['encoding'] || ENV['CHARSET'] || 'utf8'
#         ActiveRecord::Base.establish_connection AppConfig.symbolize_keys
#         $stderr.puts "#{AppConfig['database']} created"
#       end
#     end
#   end
#   # desc 'Migrate (for Sequel ORM only; not ActiveRecord)'
#   # task :migrate => [:environment] do
#   #   Sequel.extension :migration
#   #   Sequel::Migrator.run(DB, "migrations/")
#   # end
# end

