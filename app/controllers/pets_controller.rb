#  PETS CONTROLLER
#  ===============

require 'httparty'
require 'json'
require 'geocoder'

class PetsController < ApplicationController

  #  POST - /pets/petprofile/ - Allows access to a single result of Ajax request
  #  -------------------------------------------------------------------------
  post '/petsave/?' do
    @name        = params[:name]
    @animal      = params[:animal]
    @breed       = params[:breed]
    @phone       = params[:phone]
    @email       = params[:email]
    @address     = params[:address]
    @city        = params[:city]
    @state       = params[:state]
    @zip         = params[:zip]
    @description = params[:description]
    @picsmall    = params[:picsmall]
    @petid       = params[:petid]

    # result  = HTTParty.get("http://api.petfinder.com/pet.get?key=61635e39395ce71e4d0eba82c79adb55&id=#{@petid}&format=json").parsed_response
    # pet = result["petfinder"]["pet"]

    # pet = {name:        pet["name"]["$t"],
    #        type:        pet["animal"]["$t"],
    #        description: pet["description"]["$t"],
    #        phone:       pet["contact"]["phone"]["$t"],
    #        email:       pet["contact"]["email"]["$t"],
    #        address:     pet["contact"]["address1"]["$t"],
    #        city:        pet["contact"]["city"]["$t"],
    #        state:       pet["contact"]["state"]["$t"],
    #        zip:         pet["contact"]["zip"]["$t"],
    #        picsmall:    pet["media"]["photos"]["photo"][1]["$t"],
    #        petid:       pet["id"]["$t"]
    #       }

    # pet = Pet.create name: pet[:name], address: pet[:address], phone: pet[:phone], website: pet[:email], userid: session[:user_id]
    puts @description
    erb :pet
  end



  #  POST - /pets/ - Renders Ajax search results and map
  #                  sets params for us in Ajax request
  #  ---------------------------------------------------
  post '/?' do

    @animal = params[:animal]
    @breed  = params[:breed]
    @zip    = params[:zip]
    
    @zipCoord = Geocoder.coordinates(@zip)
    @zipLat = @zipCoord[0]
    @zipLng = @zipCoord[1]

  
    result  = HTTParty.get("http://api.petfinder.com/pet.find?key=61635e39395ce71e4d0eba82c79adb55&location=#{@zip}&animal=#{@animal}&breed=#{@breed}&count=9&format=json").parsed_response
    
    @petArray = []

    for animal in result["petfinder"]["pets"]["pet"] do

      pet = {"name"        =>animal["name"]["$t"],
             "animal"      =>animal["animal"]["$t"],
             "breed"       =>@breed,
             "description" =>animal["description"]["$t"],
             "phone"       =>animal["contact"]["phone"]["$t"],
             "email"       =>animal["contact"]["email"]["$t"],
             "address"     =>animal["contact"]["address1"]["$t"],
             "city"        =>animal["contact"]["city"]["$t"],
             "state"       =>animal["contact"]["state"]["$t"],
             "zip"         =>animal["contact"]["zip"]["$t"],
             "picsmall"    =>animal["media"]["photos"]["photo"][1]["$t"],
             "petid"       =>animal["id"]["$t"]
             # "piclarge"    =>animal["media"]["photos"]["photo"][3]["$t"]
            }
 
      @petArray.push(pet)
      # puts pet["description"]
    end

    @petArray.each do |i|
      address = i["address"]
      city = i["city"]
      state = i["state"]
      zip = i["zip"]

      @petAddress = "#{zip}"
      puts @petAddress
      # @petCoord = Geocoder.coordinates(@petAddress)
      # @petLat   = @petCoord[0]
      # @petLng   = @petCoord[1]
      # puts @petLat
      # puts @petLng
    end
   


    erb :results
  end

end
