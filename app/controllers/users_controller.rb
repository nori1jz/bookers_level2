class UsersController < ApplicationController
    # before_action :logged_in_user, only: [:index, :edit, :update]
    before_action :correct_user,   only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        @post_books = @user.post_books
        @post_book = PostBook.new
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
        @post_book = PostBook.new
        @users = User.all
    end
    
    def new
        @post_book = PostBook.new
    end



    private

    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
    end


end
