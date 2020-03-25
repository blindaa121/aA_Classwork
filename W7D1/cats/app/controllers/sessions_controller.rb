class SessionsController < ApplicationController
    def new
        @user = User.new
        render :login_page
    end

    def create
        @user = User.find_by_credentials(user, password)
        if @user 
            login_user!(@user)
            redirect_to cats_url
        else
            redirect_to login_page
        end
     
    end

    def destroy 
        current_user.reset_session_token!
        session[:session_token] = nil
    end
end
