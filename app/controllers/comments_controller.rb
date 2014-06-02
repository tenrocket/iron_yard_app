class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new
		@new_comment = Comment.new
	end

	def create
		@user = current_user
		@new_comment = Comment.new(comment_params)
		@new_comment.set_user!(current_user)
		if @new_comment.save
			redirect_to :back
		else
			redirect_to :new
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to comments_path
		else
			redirect_to :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to :back
		else
			redirect_to :back, notice: "Sorry, we were unable to delete this comment."
		end
	end

	def show
		@comment = Comment.find(params[:id])
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :created_at, :updated_at, :commentable_type, :commentable_id)
	end

end