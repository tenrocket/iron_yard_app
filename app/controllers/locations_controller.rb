class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def new
		@new_location = Location.new
	end

	def create
		@new_location = Location.new(location_params)
		if @new_location.save
			redirect_to locations_path
		else
			redirect_to :new
		end
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update
		@location = Location.find(params[:id])
		if @location.update_attributes(location_params)
			redirect_to locations_path
		else
			redirect_to :edit
		end
	end

	def destroy
		@location = Location.find(params[:id])
		if @location.destroy
			redirect_to locations_path
		else
			redirect_to locations_path
		end
	end

	def show
	end

	private

	def location_params
		params.require(:location).permit!
	end

end