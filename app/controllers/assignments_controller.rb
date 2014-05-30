class AssignmentsController < ApplicationController

	def index
		@assignments = Assignment.all
	end

	def new
		@new_assignment = Assignment.new
	end

	def create
		@new_assignment = Assignment.new(assignment_params)
		if @new_assignment.save
			redirect_to assignments_path
		else
			redirect_to :new
		end
	end

	def edit
		@assignment = Assignment.find(params[:id])
	end

	def update
		@assignment = Assignment.find(params[:id])
		if @assignment.update_attributes(assignment_params)
			redirect_to assignments_path
		else
			redirect_to :edit
		end
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		if @assignment.destroy
			redirect_to assignments_path
		else
			redirect_to assignments_path
		end
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	private

	def assignment_params
		params.require(:assignment).permit!
	end

end