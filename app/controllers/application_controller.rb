#  APPLICATION CONTROLLER
#  ======================

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

#  Allow sessions usage
#  --------------------
  enable :sessions

#  Locate static files and set database and adapter
#  ------------------------------------------------
  set :database, { adapter: 'sqlite3', database: File.dirname(__FILE__) + '/../../db.sqlite3' }
  set :public_folder, File.dirname(__FILE__) + '/../public'
  set :views, File.dirname(__FILE__) + '/../views'
  
end
