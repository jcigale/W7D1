class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password],
        )


    end

    def destroy
        

    end


end