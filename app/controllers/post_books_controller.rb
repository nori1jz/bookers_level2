class PostBooksController < ApplicationController

    def show
        @post_book = PostBook.find(params[:id])
    end

    def index
        @post_books = PostBook.all
        @post_book = PostBook.new
    end

    def new
        @post_book = PostBook.new
    end

    def create
        @post_book = PostBook.new(post_book_params)
        @post_book.user_id = current_user.id
        if @post_book.save
            redirect_to post_book_path
        else
            render :new
        end

    end

    def edit
         @book = Book.find(params[:id])
    end

    def update
       @book = Book.find(params[:id])
     if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
     else
      render :edit
     end

    end

    private

    def post_book_params
        params.require(:post_book).permit(:title, :body)
    end

end
