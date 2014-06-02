class SubmissionsController < ApplicationController

	def index
		@submissions = Submission.all
	end

	def new
		@new_submission = Submission.new
	end

	def create
		@user = current_user
		@new_submission = Submission.new(submission_params)
		@new_submission.set_user!(current_user)
		if @new_submission.save
			redirect_to submissions_path
		else
			redirect_to :new
		end
	end

	def edit
		@user = current_user
		if @user.admin == true
			@submission = Submission.find(params[:id])
		else
			redirect_to :back, notice: "Access denied.  Only admins can update homework status."
		end
	end

	def update
		@submission = Submission.find(params[:id])
		if @submission.update_attributes(submission_params)
			redirect_to submission_path
		else
			redirect_to :edit
		end
	end

	def destroy
		@submission = Submission.find(params[:id])
		if @submission.destroy
			redirect_to submissions_path
		else
			redirect_to submissions_path
		end
	end

	def show
		@user = current_user
		@submission = Submission.find(params[:id])
		if @submission.complete == true
			@status = "COMPLETE"
		elsif @submission.complete == false
			@status = "UNDER REVIEW"
		else
			@status = "INCOMPLETE"
		end
			
		if @user.admin == true || @user.id == @submission.user.id
			@new_comment = Comment.new
		else
			redirect_to :back, notice: "Access denied.  Only administrators may view submissions."
		end
	end

	private

	def submission_params
		params.require(:submission).permit(:title, :description, :assignment_id, :user_id, :attachment, :submission_date, :created_at, :updated_at, :reviewing, :complete, commentable_attributes:[:content])
	end

end