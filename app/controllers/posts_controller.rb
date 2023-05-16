class PostsController < ApplicationController

def show
  @post = Post.find_by({"id"=> params["id"]})
  @place = Place.find_by({"id" => @post["post_id"]})
end 

def new 
  @post = Post.new 
  @place = Place.find_by({"id" => params["place_id"]})
  @post["place_id"]= @place["id"]
end

def create
  @post = Post.new 
  #assign user-entered form data to Post's columns
  @post["title"] = params["post"]["title"]
  @post["posted_on"]= params["post"]["posted_on"]
  @post["description"]= params["post"]["description"]
  @post["place_id"]= params["post"]["place_id"]
  #save Post row
  @post.save
  #redirect user
  redirect_to "/places/#{@post["place_id"]}"
end

end
