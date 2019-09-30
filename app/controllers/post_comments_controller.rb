class PostCommentsController < ApplicationController
def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    if
    comment.save
    flash[:notice] = "You have creatad comment successfully."
	else
	flash[:notice] = "1-15 Moji !!!"
	end
	redirect_to book_path(book)
end

def show
end

def destroy
	# destroyのURLで2個のidを渡してあげる必要があるので指定してあげる
    @book = Book.find(params[:book_id])
    @comment = PostComment.find(params[:id])
    # ここで一致するかを確認している記述
    # book_idはPostCommentテーブルの中のカラムでBook.idはBookテーブルのidってこと
    @comment.book_id = @book.id
    @comment.destroy
    flash[:notice] = "You have destroyed comment successfully."
	redirect_to book_path(@book)
end

def edit
	@book = Book.find(params[:book_id])
    @comment = PostComment.find(params[:id])
end

def update
    @book = Book.find(params[:book_id])
    @comment = PostComment.find(params[:id])
    if
    @comment.update(post_comment_params)
    flash[:notice] = "You have updated successfully."
    redirect_to book_path(@book.id)
    else
    render 'edit'
    end
end

	private
	def post_comment_params
	  params.require(:post_comment).permit(:user_id,
	                      :book_id,
	                      :comment)
	end
end

