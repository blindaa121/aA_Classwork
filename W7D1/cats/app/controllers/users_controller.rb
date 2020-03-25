class UsersController < ApplicationController
    before_action :require_log_out, only: [:new]

    def new 
        @user = User.new 
        render :login_page
    end 

    def create  
        @user = User.new(user_params) 
        if @user.save 
            login_user!(@user)
            redirect_to user_url(@user) 
        else  
            render :login_page
        end
    end

    private
 
    def user_params 
        user_params.require(:user).permit(:user_name,:password)
    end
end
