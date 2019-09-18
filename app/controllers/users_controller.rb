class UsersController < ApplicationController

	def index
		@user = User.new
  		@users = User.all
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
	end

    def create
        @user = User.new(user_params)
        @user.user_id = current_user.id
        if @user.save
          redirect_to user_path
        else
          render :new
        end
    end

	def edit
		@user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to user_path(@user.id)
	end

	def start
	end

	def about
	end

	private
	def user_params
	    params.require(:user).permit(:name,:introduction, :profile_image_id)
	end
end
