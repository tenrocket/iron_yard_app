class SubmissionsController < ApplicationController

	def index
		@submissions = Submission.all
	end

	def new
		@new_submission = Submission.new
	end

	def create
		@new_submission = Submission.new(submission_params)
		if @new_submission.save
			redirect_to submissions_path
		else
			redirect_to :new
		end
	end

	def edit
		@submission = Submission.find(params[:id])
	end

	def update
		@submission = Submission.find(params[:id])
		if @submission.update_attributes(submission_params)
			redirect_to submissions_path
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
	end

	private

	def submission_params
		params.require(:submission).permit!
	end

end