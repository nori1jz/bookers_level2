class BooksController < ApplicationController
   before_action :ensure_correct_user, only: [:edit, :update, :destroy]
    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @newbook = Book.new
        @comment = Comment.new


    end

    def index
        @book = Book.find(params[:id])
        @user = current_user
        @books = Book.all
        @newbook = Book.new

    end


    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save

            redirect_to book_path(@book.id), notice: 'Book was successfully created.'

        else
            @user = current_user
            @books = Book.all
            render :index
        end

    end

    def edit
    end

    def destroy
       @book.destroy
       redirect_to books_path
    end


    def update
     if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
     else
      render :edit
     end

    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
    
    def ensure_correct_user
        @book = Book.find(params[:id])
        unless @book.user_id == current_user.id 
            redirect_to books_path
        end
    end    
end
