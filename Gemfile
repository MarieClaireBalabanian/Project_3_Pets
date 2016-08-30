#  GEM FILE
#  ========

#  Gem source
#  ----------
source 'http://rubygems.org'

#  Required gems
#  -------------
gem 'sinatra', require: 'sinatra/base'
gem 'bundler'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'bcrypt'
gem 'json'
gem 'httparty'
gem 'pry'
gem 'geocoder'
gem 'rake', '~> 11.2', '>= 11.2.2'

#  Dev dependent gems
#  ------------------
group :development, :test do
  gem 'rerun'
  gem 'sqlite3'
end

#  Production dependent gems
#  -------------------------
group :production do
  gem 'pg', '~> 0.18.4'
end
