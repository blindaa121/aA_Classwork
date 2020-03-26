class SessionsController < ApplicationController
    before_action :require_no_user!, only: %i(create new)

    def create 
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            flash.now[:errors] = ["Incorrect email and/or password"]
            render :new
        else  
            login_user!(user) # resets the session_token and session[:session_token]
            redirect_to user_url(user)
        end 
    end

    def destroy 
        logout_user!
        redirect_to new_session_url
    end 

    def new 
        render :new
    end
end
