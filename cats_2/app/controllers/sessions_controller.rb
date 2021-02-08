class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password],
        )
        if @user.nil?
            render :new
        else
            login!(@user)
            redirect_to cats_url
        end

    end

    def destroy
        logout!
        redirect_to cats_url
    end


end