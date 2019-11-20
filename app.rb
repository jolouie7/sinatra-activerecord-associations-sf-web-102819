require_relative 'config/environment'
require "pry"

class App < Sinatra::Base
  get "/" do 
    redirect to "/owners"
  end

  #display all owners
  get "/owners" do
    @owners = Owner.all
    erb :index
  end
  
  #show
  get "/owners/:id" do
    @owner = Owner.find(params[:id])
    erb :show
    # binding.pry
  end

  #create
  get "/owners/new" do 
    #give the user a form to create
    erb :new
  end

  post "/owners" do
    #creates new owner instance
    @owner = Owner.create(params)
    redirect to "/owners/#{@owner.id}"
  end
  #update
  #delete
end