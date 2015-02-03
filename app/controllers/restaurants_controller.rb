class RestaurantsController < ApplicationController
	
	def index
		@restaurants = Restaurant.all
	end


	def new
		@restaurants = Restaurant.new
	end 

	def create
		@restaurant = Restaurant.create(params.require[:restaurant].permit(:name, :address, :phone))
		#same as
		#@restaurant = Restaurant.new(params[:restaurant] )
		#@restaurant.save 
		redirect_to restaurant_url
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	#strong_parameters prevents this problem...
	#def create
		#a malicious user edited your form to include a "superuser field"
		#so params[:user] = {name: 'Rotten Guy', superuser} 
	#	@user = User.create(params[:user])
		#now the rotten guy has made himself into a superuser
	#end


end
