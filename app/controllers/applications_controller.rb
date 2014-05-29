class ApplicationsController < ApplicationController

	def index
		@applications = Application.all
	end

	def new
		@new_application = Application.new
	end

	def create
		@new_application = Application.new(application_params)
		if @new_application.save
			redirect_to applications_path
		else
			redirect_to :new
		end
	end

	def edit
		@application = Application.find(params[:id])
	end

	def update
		@application = Application.find(params[:id])
		if @application.update_attributes(application_params)
			redirect_to applications_path
		else
			redirect_to :edit
		end
	end

	def destroy
		@application = Application.find(params[:id])
		if @application.destroy
			redirect_to applications_path
		else
			redirect_to applications_path
		end
	end

	def show
	end

	private

	def application_params
		params.require(:application).permit!
	end

end