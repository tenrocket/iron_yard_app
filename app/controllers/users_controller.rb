class UsersController < ApplicationController
	skip_filter :ensure_logged_in, only: [:new, :create]
	def index
		@users = User.all
	end

	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			# debugger
			if params[:request] == "1"
				UserMailer.new_admin_request(@new_user)
			end
			redirect_to users_path, notice: "Thanks for signing up!  You are awesome."
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to users_path
		else
			redirect_to users_path
		end
	end

	def show
		@user = User.find(params[:id])
		@new_comment = @user.comments.build
	end

	private

	def user_params
		params.require(:user).permit!
	end
end