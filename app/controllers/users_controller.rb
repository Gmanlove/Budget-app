class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @user = current_user
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        flash[:notice] = 'User profile updated successfully.'
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  