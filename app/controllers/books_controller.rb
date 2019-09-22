class BooksController < ApplicationController

  # ログインしてる時だけ許可するアクションをonlyで指定
  before_action :authenticate_user!, only: [:index,:show,:edit,:create,:update,:destroy]

  def index
  	@book = Book.new
  	@books = Book.all
    # 全部を表示するだけなので紐付け不要
    @user = current_user
  end

  def show
    @book = Book.new
  	@book_show = Book.find(params[:id])
    @user = User.find(@book_show.user_id)
  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def create
    @user = current_user
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @users = User.all
    if
      @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      render 'index'
    end
  end

  def update
    @book = Book.find(params[:id])
    if
      @book.update(book_params)
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'edit'
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
    flash[:notice] = ""
  	redirect_to books_path
  end

  def start
  end

	private

	def book_params
	  params.require(:book).permit(:title, :body)
	end
end
