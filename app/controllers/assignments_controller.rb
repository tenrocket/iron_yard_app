class AssignmentsController < ApplicationController

	def index
		@assignments = Assignment.all
	end

	def new
		@new_assignment = Assignment.new
	end

	def create
		@user = current_user
		if @user.admin == true
			@new_assignment = Assignment.new(assignment_params)
			if @new_assignment.save
				redirect_to assignments_path
			else
				redirect_to :new
			end
		else
			redirect_to :back, notice: "Access denied.  Only administrators may view submissions."
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
		@new_comment = Comment.new
	end

	private

	def assignment_params
		params.require(:assignment).permit(:title, :description, :due_date, :attachment, :user_id, :created_at, :updated_at, :cohort_id, commentable_attributes:[:content])
	end

end