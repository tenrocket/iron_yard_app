class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new
		@new_comment = Comment.new
	end

	def create
		@new_comment = Comment.new(comment_params)
		if @new_comment.save
			redirect_to comments_path
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
			redirect_to comments_path
		else
			redirect_to comments_path
		end
	end

	def show
	end

	private

	def comment_params
		params.require(:comment).permit!
	end

end