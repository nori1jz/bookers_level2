class UsersController < ApplicationController
    # before_action :logged_in_user, only: [:index, :edit, :update]
    # before_action :current_user,   only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        @books = @user.books
        @book = Book.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end    

    def index
        @user = current_user
        @book = Book.new
        @users = User.all
    end
    
    def new
        @book = Book.new
    end



    private

    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
    end


end
