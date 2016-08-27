#  PETS CONTROLLER
#  ===============

require 'httparty'
require 'json'
require 'geocoder'


class PetsController < ApplicationController


  #  POST - /pets/petsave/ - Saves a pet profile to users collection
  #  ---------------------------------------------------------------
  post '/petsave/?' do
    @petid = params[:petdata]

    result  = HTTParty.get("http://api.petfinder.com/pet.get?key=61635e39395ce71e4d0eba82c79adb55&id=#{@petid}&format=json").parsed_response
    pet = result["petfinder"]["pet"]

    pet = {
      name:        pet["name"]["$t"],
      animal:      pet["animal"]["$t"],
      description: pet["description"]["$t"],
      phone:       pet["contact"]["phone"]["$t"],
      email:       pet["contact"]["email"]["$t"],
      address:     pet["contact"]["address1"]["$t"],
      city:        pet["contact"]["city"]["$t"],
      state:       pet["contact"]["state"]["$t"],
      zip:         pet["contact"]["zip"]["$t"],
      picsmall:    pet["media"]["photos"]["photo"][1]["$t"],
      petid:       pet["id"]["$t"]
    }

    pet = Pet.create name: pet[:name], animal: pet[:animal], address: pet[:address], phone: pet[:phone], email: pet[:email], description: pet[:description], photo: pet[:picsmall], userid: session[:user_id]

    redirect '/profile/'
  end


  #  POST - /pets/ - Renders Ajax search results and map
  #                  sets params for us in Ajax request
  #  ---------------------------------------------------
  post '/?' do
    @animal = params[:animal]
    @breed  = params[:breed]
    @zip    = params[:zip]
    
    # @zipCoord = Geocoder.coordinates(@zip)
    # @zipLat = @zipCoord[0]
    # @zipLng = @zipCoord[1]
  
    result  = HTTParty.get("http://api.petfinder.com/pet.find?key=61635e39395ce71e4d0eba82c79adb55&location=#{@zip}&animal=#{@animal}&breed=#{@breed}&count=25&format=json").parsed_response
    
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
            }
 
      @petArray.push(pet)
      puts pet["name"]
    end

    # @petArray.each do |i|
    #   address = i["address"]
    #   city = i["city"]
    #   state = i["state"]
    #   zip = i["zip"]

    #   @petAddress = "#{zip}"
    #   puts @petAddress
    #   @petCoord = Geocoder.coordinates(@petAddress)
    #   @petLat   = @petCoord[0]
    #   @petLng   = @petCoord[1]
    #   puts @petLat
    #   puts @petLng
    # end
   
    erb :results
  end
end
