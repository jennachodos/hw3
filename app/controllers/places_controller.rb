class PlacesController < ApplicationController


def index
  #find all place rows
  #render places/show view with posts in Place
  @places = Place.all
end

def show
  #find a place 
  #render place with posts within place
  @place = Place.find_by({"id" => params["id"]})
  @posts = Post.where({"place_id" => @place["id"]})

end

def new
  #render view with new Place form
  @place = Place.new
end

def create
  #start with a new Place
  @place = Place.new
  #assign user-entered form data to Place columns
  @place["name"] = params["place"]["name"]
  #save Place row
  @place.save
  #redirect user back to place view
  redirect_to "/places"
end

end
