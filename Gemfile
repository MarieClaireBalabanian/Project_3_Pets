#  GEM FILE
#  ========

#  Gem source
#  ----------
source 'http://rubygems.org'

#  Required gems
#  -------------
gem 'rack'
gem 'sinatra', require: 'sinatra/base'
gem 'bundler'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'bcrypt'
gem 'json'
gem 'httparty'
gem 'geocoder'
gem 'rake', '~> 11.2', '>= 11.2.2'
gem 'pry'
#gem 'mysql2', '~> 0.4.4'



#  Environment gems
#  ------------------
group :development, :test do
  gem 'rerun'
  gem 'sqlite3'
end

#  Production dependent gems
#  -------------------------
group :production do
  #gem 'mysql2', '~> 0.4.4'
  gem 'pg'
end
