class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
    end

    def index
      @user = User.find(current_user.id)
      @book = Book.new
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
      if @user.id == current_user.id
        render :edit
      else
        redirect_to user_path(current_user.id)
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:updated] = "You have updated user successfully."
      redirect_to user_path(@user.id)
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

end
