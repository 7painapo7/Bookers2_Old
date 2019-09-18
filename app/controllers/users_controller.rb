class UsersController < ApplicationController

	def index
		@user = User.new
  		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books.reverse_order
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
	    params.require(:user).permit(:name, :introduction, :profile_image)
	end
end