class UsersController < ApplicationController

    def create 
        @user = User.new(user_params)
        if @user.save 
            login_user!(@user)
            # redirect_to  will jump back to this later!
        else   
            flash.now[:errors] = @user.errors.full_messages #if login is not successful, render new 
            render :new
        end
    end 

    def show 
        @user = User.find(params[:id])
        render :show
    end

    def new 
        @user = User.new 
        render :new
    end 

    private 

    def user_params 
        params.require(:user).permit(:email, :password)
    end
end
