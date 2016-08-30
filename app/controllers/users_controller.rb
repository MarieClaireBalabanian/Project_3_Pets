#  USERS CONTROLLER
#  ================

class UsersController < ApplicationController


  #  GET - /users/ - access JSON of all registered users
  #  ---------------------------------------------------
  get '/allusers/?' do
    users = User.all

    if users
      users.to_json
    else
      { status: 'error', message: 'No users found' }.to_json
    end
  end


  #  GET - /users/profile/ - goes to profile page if logged in
  #  ---------------------------------------------------------
  get '/profile/?' do
    if session[:is_logged_in] == true

      user = User.find_by(id: session[:user_id])
      @user = {
        "username"  =>user["username"],
        "password"  =>user["password"],
        "firstname" =>user["firstname"],
        "lastname"  =>user["lastname"],
        "id"        =>user["id"]
      }

      @petlist = []

      petsget = JSON.parse(Pet.where(userid: session[:user_id]).to_json)
      
      for pet in petsget do
        @petlist.push(pet)
        puts pet["name"]
      end

      # for pet in petsget do
      #   puts pet
      # end 
      # puts '=================================='







      # for pet in petsget do
      # pet = {"name"        =>animal["name"]["$t"],
      #        "animal"      =>animal["animal"]["$t"],
      #        "breed"       =>@breed,
      #        "description" =>animal["description"]["$t"],
      #        "phone"       =>animal["contact"]["phone"]["$t"],
      #        "email"       =>animal["contact"]["email"]["$t"],
      #        "address"     =>animal["contact"]["address1"]["$t"],
      #        "city"        =>animal["contact"]["city"]["$t"],
      #        "state"       =>animal["contact"]["state"]["$t"],
      #        "zip"         =>animal["contact"]["zip"]["$t"],
      #        "picsmall"    =>animal["media"]["photos"]["photo"][1]["$t"],
      #        "petid"       =>animal["id"]["$t"]
      #       }
 
      # @savedpets.push(pet)
      # puts pet["name"]
      # end


      erb :user
    else
      redirect '/'
    end
  end


  #  POST - /users/signup/ - sets up a new user
  #                          bcrypts password
  #  ------------------------------------------
  post '/signup/?' do
    # Creates a new user
    user = User.find_by username: params['username']

    if (params['username'] == '') || (params['password'] == '') || (params['firstname'] == '') || (params['lastname'] == '')
      @sign_message = "please complete all fields!"
      erb :home
    elsif user
      @sign_message = "That username already exists!"
      erb :home
    else
      password = BCrypt::Password.create(params['password'])
      user = User.create username: params['username'], password: password, firstname: params['firstname'], lastname: params['lastname']
      session[:is_logged_in] = true
      session[:user_id] = user.id
      redirect '/profile'
    end
  end


  #  GET - /users/logout/ - cancels active session
  #  ---------------------------------------------
  get '/logout/?' do
    session =  nil
    redirect '/'
  end


  #  POST - /users/login/ - logs in registered user
  #  ----------------------------------------------
  post '/login/?' do
    user = User.find_by username: params['username']
    if (params['username'] == '') || (params['password'] == '')
      @log_message = "Please complete all fields"
      erb :home
    elsif !user
      @log_message = "That username doesn't exist"
      erb :home
    elsif user
      password = BCrypt::Password.new(user.password)
      if password == params['password'] 
        session[:is_logged_in] = true
        session[:user_id] = user.id
        redirect '/profile'
      else
        @log_message = "Incorrect password"
        erb :home
      end
    end
  end


  #  GET - /users/ - render the home page
  #  ------------------------------------
  get '/?' do
    erb :home
  end

end
