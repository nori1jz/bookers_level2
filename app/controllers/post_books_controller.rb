class PostBooksController < ApplicationController

    def show
        @post_book = PostBook.find(params[:id])
        @user = @post_book.user
        @new_post_book = PostBook.new


    end

    def index
        @user = User.find(params[:id])
        @post_books = PostBook.all
        @post_book = PostBook.new
        @user = @post_book.user
    end

    def new
        @post_book = PostBook.new
    end

    def create
        @post_book = PostBook.new(post_book_params)
        @post_book.user_id = current_user.id
        if @post_book.save

            redirect_to post_book_path(@post_book.id)
        else
            render :new
        end

    end

    def edit
         @post_book = PostBook.find(params[:id])
    end

    def destroy
       @post_book = PostBook.find(params[:id])
       @post_book.destroy
       redirect_to post_books_path
    end


    def update
       @post_book = PostBook.find(params[:id])
     if @post_book.update(post_book_params)
      redirect_to post_book_path(@post_book.id), notice: 'Book was successfully updated.'
     else
      render :edit
     end

    end

    private

    def post_book_params
        params.require(:post_book).permit(:title, :body)
    end

end
