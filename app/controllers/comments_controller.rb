class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = @book.id
    comment.save
    # redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = @book.comments.find(params[:id])
    comment.destroy
    
    # Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # comment.book = @book.id
    # comment = @book.comments.find(params[:id])
    # redirect_to book_path(params[:book_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
